select 
    organization_id
    , first_payment_date AS organization_first_payment_date
    , last_payment_date AS organization_last_payment_date
    , legal_entity_country_code AS organization_legal_entity_country_code
    , count_total_contracts_active AS organization_total_active_contracts
    , created_date AS organization_created_date
from {{ source('raw', 'organizations') }}
