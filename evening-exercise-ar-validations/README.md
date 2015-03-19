#How would you return all the recipes in your database?
  * Recipe.all

#How would you return all the comments in your database?
  * Comment.all

#How would you return the most recent recipe posted in your database?
  * last_recipe = Recipe.last (might give you unexpected order if things are modified)
  * last_recipe = Recipe.order('created_by').last (better to use)


#How would you return all the comments of the most recent recipe in your database?
  * Comment.where(recipe_id: last_recipe.id)
  * Comment.where(recipe: last_recipe)
  * last_recipe.comments

#How would you return the most recent comment of all your comments?
  last_comment = Comment.last
  last_comment = Comment.order('created_at').last

#How would you return the recipe associated with the most recent comment in your database?
  * last_comment.recipes
  * Recipe.where(comment: last_comment)


#How would you return all comments that include the string brussels in them?
  * Comment.where(body: '%brussels%')




=============================
recipe1= Recipe.create(name: "Brussels Sprouts 1", description: "Recipe 1", instructions: "Cook them 1")
recipe2= Recipe.create(name: "Brussels Sprouts 2", description: "Recipe 2", instructions: "Cook them 2")
recipe3= Recipe.create(name: "Brussels Sprouts 3", description: "Recipe 3", instructions: "Cook them 3")
recipe4= Recipe.create(name: "Brussels Sprouts 4", description: "Recipe 4", instructions: "Cook them 4")
recipe5= Recipe.create(name: "Brussels Sprouts 5", description: "Recipe 5", instructions: "Cook them 5")


Comment.create(body: 'Comment1.1', recipe_id: recipe1.id)
Comment.create(body: 'Comment1.2', recipe_id: recipe1.id)
Comment.create(body: 'Comment1.3', recipe_id: recipe1.id)

Comment.create(body: 'Comment2.1', recipe_id: recipe2.id)
Comment.create(body: 'Comment2.2', recipe_id: recipe2.id)
Comment.create(body: 'Comment2.3', recipe_id: recipe2.id)

Comment.create(body: 'Comment3.1', recipe_id: recipe3.id)
Comment.create(body: 'Comment3.2', recipe_id: recipe3.id)
Comment.create(body: 'Comment3.3', recipe_id: recipe3.id)

Comment.create(body: 'Comment4.1', recipe_id: recipe4.id)
Comment.create(body: 'Comment4.2', recipe_id: recipe4.id)
Comment.create(body: 'Comment4.3', recipe_id: recipe4.id)

Comment.create(body: 'Comment5.1', recipe_id: recipe5.id)
Comment.create(body: 'Comment5.2', recipe_id: recipe5.id)
Comment.create(body: 'Comment5.3', recipe_id: recipe5.id)
