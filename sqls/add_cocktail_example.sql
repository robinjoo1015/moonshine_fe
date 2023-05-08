INSERT INTO moonshine.cocktails (cocktail_name, cocktail_instructions, cocktail_description) VALUES ('Margarita', 'Shake with ice. Strain into glass. Garnish with lime wedge.', 'A classic cocktail made with tequila, lime juice, and triple sec.');
INSERT INTO moonshine.ingredient (ingredient_name, ingredient_description)
    VALUES ('Tequila', 'A distilled beverage made from the blue agave plant.'),
           ('Lime Juice', 'The juice of a lime.'),
           ('Triple Sec', 'An orange-flavored liqueur made from the dried peels of bitter and sweet oranges.');

SELECT cocktail_id FROM moonshine.cocktails WHERE cocktail_name = 'Margarita';
SELECT ingredient_id FROM moonshine.ingredient WHERE ingredient_name IN ('Tequila', 'Lime Juice', 'Triple Sec');

INSERT INTO MOONSHINE.cocktail_composition (cocktail_id, ingredient_id, ingredient_quantity)
VALUES (1, 1, '2 oz'),
       (1, 2, '1 oz'),
       (1, 3, '1/2 oz');