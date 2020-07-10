<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\Order;
use Illuminate\Support\Str;
use Helper;
class  PaymentController extends Controller
{
    public function payment_success(Request $request) {
        try {
            $order=new Order();
            $order['order_number'] = 'ORD-'.strtoupper(Str::random(10));
            $order['sub_total'] = Helper::cartCount();;
            $order['total_amount'] = Helper::totalCartPrice();
            $order['quantity'] = Helper::cartCount();
            $order['user_id']=$request->user()->id;
            $order['first_name'] = auth()->user()->name;
            $order['last_name'] = auth()->user()->name;
            $order['email'] = auth()->user()->email;
            $order['phone'] = "086603723";
            $order['country'] = "VN";
            $order['address1'] = "VN";
            $status = $order->save();
            Cart::where('user_id', auth()->user()->id)->where('order_id', null)->update(['order_id' => $order->id]);
            return view("backend.payment.success");
        } catch (\Exception $e) {
            request()->session()->flash('error','Số lượng request vnpay bị giới hạn, vui lòng đăng nhập lại để thao tác !');
        }
           
      
    }
    public function vnpay_payment(Request $request) {
        $vnp_Url = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
        $vnp_Returnurl = "http://localhost:8000/payment-success";
        $vnp_TmnCode = "AX2TED0G";//Mã website tại VNPAY 
        $vnp_HashSecret = "SN4TT5YN04PMK5TXVRPC6F9YT7QXVI4K"; //Chuỗi bí mật
        
        $vnp_TxnRef =date('YmdHis');
        $vnp_OrderInfo = "order_desc";
        $vnp_OrderType = "order_type";
        $vnp_Amount =  $request->input('amount') * 100;
        $vnp_Locale = "VN";
        $vnp_BankCode = "NCB";
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];
        
        $inputData = array(
            "vnp_Version" => "2.1.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef
          
        );
        
        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        if (isset($vnp_Bill_State) && $vnp_Bill_State != "") {
            $inputData['vnp_Bill_State'] = $vnp_Bill_State;
        }
        
        //var_dump($inputData);
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . urlencode($key) . "=" . urlencode($value);
            } else {
                $hashdata .= urlencode($key) . "=" . urlencode($value);
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }
        
        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            $vnpSecureHash =   hash_hmac('sha512', $hashdata, $vnp_HashSecret);//  
            $vnp_Url .= 'vnp_SecureHash=' . $vnpSecureHash;
        }
        $returnData = array('code' => '00'
            , 'message' => 'success'
            , 'data' => $vnp_Url);
            if (isset($_POST['redirect'])) {
                header('Location: ' . $vnp_Url);
                die();
            } else {
                echo json_encode($returnData);
            }
            return redirect($vnp_Url);
    }
}
