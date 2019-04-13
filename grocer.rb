def consolidate_cart(cart)
  consolidated_cart={}
  counter=0

   cart.each do

     cart[counter].each do |k,v|
      if consolidated_cart[k]
        consolidated_cart[k][:price]=cart[counter][k][:price]
        consolidated_cart[k][:clearance]=cart[counter][k][:clearance]
        consolidated_cart[k][:count]+=1
      else
        consolidated_cart[k]=cart[counter][k]
        consolidated_cart[k][:price]=cart[counter][k][:price]
        consolidated_cart[k][:clearance]=cart[counter][k][:clearance]
        consolidated_cart[k][:count]=1
      end
    end

     counter+=1
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  return_cart = cart
counter = 0
coupons.each do
if cart[ coupons[counter][:item] ]
  item_name=coupons[counter][:item]
  coupon_count=coupons[counter][:num]
  cart_count=return_cart[coupons[counter][:item]][:count]

  if coupon_count<=cart_count
    apply_count=coupon_count
    voucher_name = "#{coupons[counter][:item]} W/COUPON"
    if !return_cart[voucher_name]
      return_cart[voucher_name]={}
      return_cart[voucher_name][:price]=coupons[counter][:cost]
      return_cart[voucher_name][:clearance]=return_cart[item_name][:clearance]
      return_cart[voucher_name][:count]=0
    end
    return_cart[voucher_name][:count]+=1
    return_cart[item_name][:count]=cart_count-apply_count
  end

 end
counter+=1
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
