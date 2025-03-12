-- 12/03/2025

/* CHECK USING CONSIGNMENT ORDER / GIFT DOCUMENT NO  - TO GET THE INTERNAL TRANSFER DOCUMENT NO */

SELECT
    b.documentno   cons,
    a.documentno   it
FROM
    m_movement            a
    JOIN um_consignmentorder   b ON b.um_consignmentorder_id = a.um_consignmentorder_id
WHERE
    b.documentno IN (
        'CM62025-012',
        'CM62025-013',
        'CM62025-014'
    );
    
/*query to get do document using po reference*/

SELECT
    docstatus, documentno, poreference
FROM
    m_inout where poreference
in (
'E013413854629453'
);
