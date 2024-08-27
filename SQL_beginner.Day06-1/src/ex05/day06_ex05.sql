COMMENT ON TABLE person_discounts IS 'person_discounts table is to store information about personal discounts that are given to customers';
COMMENT ON COLUMN person_discounts.id IS 'id is primary key fot person_discounts table';
COMMENT ON COLUMN person_discounts.person_id IS 'person_id is a unique identifier of a person in a person_discounts table';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'pizzeria_id is a unique identifier of a pizzeria in a person_discounts table';
COMMENT ON COLUMN person_discounts.discount IS 'discount is a personal parameter for each person in each pizzeria in a person_discounts table';