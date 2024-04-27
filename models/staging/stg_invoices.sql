select 
    invoice_id
    , parent_invoice_id
    , transaction_id
    , organization_id
    , type AS invoice_type_id
    , status AS invoice_status
    , currency AS invoice_currency
    , fx_rate AS invoice_conversion_rate
    , amount AS invoice_amount
    , ROUND(invoice_amount / invoice_conversion_rate, 2) AS invoice_usd_amount
    , payment_method AS invoice_payment_method
    , payment_currency AS invoice_payment_currency
    , ZEROIFNULL(payment_amount) AS invoice_payment_original_currency_amount
    , fx_rate_payment AS invoice_payment_conversion_rate
    , ZEROIFNULL(ROUND(payment_amount / fx_rate, 2)) AS invoice_payment_usd_amount
    , invoice_usd_amount - invoice_payment_usd_amount AS invoice_due_usd_amount
from {{ source('raw', 'invoices') }}
