# How to run the application?

you just need to enter to the folder of the application and run the client.rb file

```
cd shopping_basket
ruby client.rb
```

As soon as you run the ruby file you are going to see the following menu:


Let's fill the shopping cart with some products 

Please select which action you want to perform:
1. Add a product
2. Generate receipt
3. Exit

Enter your choice:  here you just need to enter the action you want to trigger (1|2|3)

if you selected the option 1 (Adding a product)

you will need to enter the necessary information to create a product : name, price and quantity

then you can select anothe action to trigger.


# Brief explanation

I implemented the composite design pattern here because I wanted to allow to the possibility to also support tree-like structure.

lets say that for instance I want to add an 'imported box of chocolates' but instead of passing in the price the total of the box itself you want to pass just the unit price.


I created the  component.rb interface common for product_list_composite.rb and product.rb

For this specific approach the product_list_composite is the container(Parent) of different products


