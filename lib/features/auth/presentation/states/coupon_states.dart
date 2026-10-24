abstract class CouponStates {}

class CouponInitial extends CouponStates{}

class CouponLoading extends CouponStates{}

class CouponApplied extends CouponStates{
  final String coupon;
  final double discount;
  CouponApplied(this.coupon,this.discount);
}

class CouponError extends CouponStates{
  final String error;
  CouponError(this.error);
}