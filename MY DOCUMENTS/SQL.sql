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

select Docstatus,Documentno,Um_Lddno,Description, Created, Updated from m_movement where documentno='1IM12502-10209';

--USING IT DESCRIPTION AND LDD NO FIND PARTICULAR DOCUMENT
SELECT
    mm.M_MOVEMENT_ID,
    mm.DOCSTATUS,
    mm.DOCUMENTNO,
    mm.UM_LDDNO,
    mm.DESCRIPTION,
    mm.CREATED,
    mm.UPDATED,
    mm.AD_ORG_ID,
    COUNT(mml.M_MOVEMENTLINE_ID) AS MOVEMENTLINE_COUNT
FROM
    M_MOVEMENT mm
LEFT JOIN
    M_MOVEMENTLINE mml
    ON mm.M_MOVEMENT_ID = mml.M_MOVEMENT_ID
WHERE
    mm.DESCRIPTION = 'WDC AV->AV' 
and     mm.um_lddno='r1'    
    AND mm.CREATED > TO_DATE('2025-02-01', 'YYYY-MM-DD')
    AND mm.AD_ORG_ID = 1000102
GROUP BY
    mm.M_MOVEMENT_ID,
    mm.DOCSTATUS,
    mm.DOCUMENTNO,
    mm.UM_LDDNO,
    mm.DESCRIPTION,
    mm.CREATED,
    mm.UPDATED,
    mm.AD_ORG_ID
HAVING
    COUNT(mml.M_MOVEMENTLINE_ID) >1;


-- PRODUCT AND QTY DETAILS USING M_MOVEMENT_ID
SELECT
    p.value,
    ml.um_qtyincarton,
    ml.um_qtyintin,
    ml.targetqty,
    ml.movementqty
FROM
    m_movementline   ml
    JOIN m_product        p ON ml.m_product_id = p.m_product_id
WHERE ml.m_movement_id in();


-- PRODUCT AND QTY DETAILS USING M_MOVEMENT_ID AND ALSO CURRENT QTY IN THE LOCATOR
SELECT
    ml.line,
    p.value,
    l.value AS FROMl,
    asi.lot AS asi,
    asi.guaranteedate,
--    ml.um_qtyincarton,
--    ml.um_qtyintin,
--    ml.targetqty,
    ml.movementqty,
    lt.value AS TOl
FROM
    m_movementline ml
    JOIN m_product p ON ml.m_product_id = p.m_product_id
    JOIN m_Attributesetinstance asi ON ml.m_attributesetinstance_id = asi.m_attributesetinstance_id
    JOIN m_locator l ON ml.m_locator_id = l.m_locator_id
    JOIN m_locator lt ON ml.m_locatorto_id = lt.m_locator_id
WHERE 
    ml.m_movement_id in (select m_movement_id from m_movement where m_movement.documentno='1IM12502-10224')
order by ml.line;



