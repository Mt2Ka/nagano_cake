
[1mFrom:[0m /home/ec2-user/environment/nagano_cake/app/controllers/public/orders_controller.rb:11 Public::OrdersController#confirm:

     [1;34m7[0m: [32mdef[0m [1;34mconfirm[0m
     [1;34m8[0m:   @order = [1;34;4mOrder[0m.new
     [1;34m9[0m:   @cart_items = current_customer.cart_items.all
    [1;34m10[0m:   binding.pry
 => [1;34m11[0m:   [32mif[0m params[[33m:order[0m][[33m:delivery_address[0m].to_i == [1;34m0[0m
    [1;34m12[0m:     @order.delivery_postal_code = current_customer.postal_code
    [1;34m13[0m:     @order.delivery_address = current_customer.address
    [1;34m14[0m:     @order.delivery_name = current_customer.last_name + current_customer.first_name
    [1;34m15[0m:   [32melsif[0m params[[33m:order[0m][[33m:delivery_address[0m].to_i == [1;34m1[0m
    [1;34m16[0m:     @address = [1;34;4mAddress[0m.find(params[[33m:order[0m][[33m:address_id[0m])
    [1;34m17[0m:     @order.delivery_postal_code = @address.postal_code
    [1;34m18[0m:     @order.delivery_address = @address.address
    [1;34m19[0m:     @order.delivery_name = @address.name
    [1;34m20[0m:   [32melse[0m params[[33m:order[0m][[33m:delivery_address[0m].to_i == [1;34m2[0m
    [1;34m21[0m:     @address = [1;34;4mAddress[0m.new
    [1;34m22[0m:     @order.delivery_postal_code = @address.postal_code
    [1;34m23[0m:     @order.delivery_address = @address.address
    [1;34m24[0m:     @order.delivery_name = @address.name
    [1;34m25[0m:   [32mend[0m
    [1;34m26[0m: 
    [1;34m27[0m:   @order.payment_method = params[[33m:order[0m][[33m:payment_method[0m]
    [1;34m28[0m:   @order.postage = [1;34m800[0m
    [1;34m29[0m:   @total = [1;34m0[0m
    [1;34m30[0m: [32mend[0m

