import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_cart_app/features/auth/presentation/events/coupon_events.dart';
import 'package:product_cart_app/features/auth/presentation/states/coupon_states.dart';

class CouponBloc extends Bloc<CouponEvents,CouponStates>{
  CouponBloc(): super(CouponInitial()){
    on<ApplyCoupon>(applyCoupon);
    on<RemoveCoupon>(removeCoupon);
  }

  void applyCoupon(ApplyCoupon event,Emitter<CouponStates> emit){
    emit(CouponLoading());
    if(event.coupon.trim().contains('SAVE10')){
       var discount = event.subTotal*0.10;
      emit(CouponApplied(event.coupon,discount));
    }else{
     emit(CouponError("Invalid Coupon Code"));
    }
  }

  void removeCoupon(RemoveCoupon event,Emitter<CouponStates> emit){
      emit(CouponInitial());
  }

}