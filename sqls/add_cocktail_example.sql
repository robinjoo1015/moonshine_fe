SELECT ingredient_name, ingredient_quantity FROM moonshine.ingredient, moonshine.cocktail_composition
                WHERE ingredient.ingredient_id = cocktail_composition.ingredient_id
                AND cocktail_composition.cocktail_id = 1;