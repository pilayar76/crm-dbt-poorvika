with transactions as (

        select * from {{ ref('stg_transactions') }}

),

inter_transactions as (
		
	select transactions._id as _id,
           transactions.item_object->'status' as status,
           transactions.item_object->'currentStatus' as currentStatus,
           transactions.item_object->'remarks' as remarks,
           transactions.item_object->'actionBy'->'name' as name,
           transactions.item_object->'actionBy'->'empId' as empId,
           transactions.item_object->'actionBy'->'branch' as branch,
           transactions.item_object->'actionBy'->'date' as actionDate
    from transactions

),

final as (

    select _id,
    	   trim('"' from status::text) as status,
    	   trim('"' from currentStatus::text) as currentStatus,
    	   trim('"' from remarks::text) as remarks,
    	   trim('"' from name::text) as name,
    	   trim('"' from empId::text) as empId,
    	   trim('"' from branch::text) as branch,
           actionDate::text::timestamp as actionDate
    from inter_transactions
)

select * from final
