
  create view "airbyte"."public"."enquires_dbt_model__dbt_tmp" as (
    with enquiries as (

	select customerId,
	       salesReturnId
	from enquiries
)

select * from enquiries
  );