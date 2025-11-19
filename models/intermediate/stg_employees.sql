

WITH src AS (
    SELECT * FROM {{ source('src1', 'stg_employees') }}
)

SELECT
    ROW_NUMBER() OVER (ORDER BY EMPLOYEE_ID) AS employee_sk,

    EMPLOYEE_ID AS employee_id,
    EMPLOYEE_FIRST_NAME || ' ' || EMPLOYEE_LAST_NAME AS employee_name,

    EMPLOYEE_ADDRESS AS employee_address,
    EMPLOYEE_CITY AS employee_city,
    EMPLOYEE_STATE AS employee_state,
    EMPLOYEE_ZIP_CODE AS employee_zip_code,

    EMPLOYEE_MOBILE AS employee_mobile,
    {{ format_phone('EMPLOYEE_FIXEDLINE') }} AS employee_fixed_line,

    EMPLOYEE_EMAIL AS employee_email,
    {{ gender_full('EMPLOYEE_GENDER') }} AS employee_gender,
    
    EMPLOYEE_AGE AS employee_age,
    {{ age_group('EMPLOYEE_AGE') }} AS age_group,

    POSITION_TYPE AS position_type,
    DEALERSHIP_ID AS dealership_id,
    DEALERSHIP_MANAGER AS dealership_manager,
    SALARY AS employee_salary,
    REGION AS employee_region,

    {{ date_to_key('HIRE_DATE') }} AS hired_date_key,
    {{ date_to_key('DATE_ENTERED') }} AS insert_dk,
    {{ date_to_key('DATE_ENTERED') }} AS update_dk

FROM src
