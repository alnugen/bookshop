Product.delete_all
# . . .
Product.create!(title: 'Programming Ruby 1.9 & 2.0',
description:
%{<p>
Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
</p>},
image_url: 'ruby.jpg',
price: 49.95)

Product.create!(title: 'Learing Ruby On Rails',
description:
%{<p>
Its all about learning to develop a web application using
Rails framework. Everything upto now is neat and tidy!
</p>},
image_url: 'rails.jpg',
price: 64.9)
# . . .