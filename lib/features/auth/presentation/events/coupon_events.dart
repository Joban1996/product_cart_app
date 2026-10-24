abstract class CouponEvents {}

class ApplyCoupon extends CouponEvents{
  final String coupon;
  final double subTotal;
  ApplyCoupon(this.coupon,this.subTotal);
}

class RemoveCoupon extends CouponEvents{
}

