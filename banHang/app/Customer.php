<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;

class Customer extends Model implements AuthenticatableContract
{
    use Notifiable;
    use Authenticatable;
    protected $table='customers';
    protected $primaryKey='id';
    public $timestamps = false;
    public function storeCustomer($fullName, $sex, $birth, $phone, $email, $address, $userName, $password)
    {
        $customer = new Customer();
        $customer->fullname = $fullName;
        $customer->sex = $sex;
        $customer->birth = $birth;
        $customer->phone = $phone;
        $customer->email = $email;
        $customer->address = $address;
        $customer->username = $userName;
        $customer->password = $password;
        return $customer->save();
    }
    public function updateCustomer($id,$fullName, $sex, $birth, $phone, $email, $address, $userName, $password)
    {
        return DB::table('customers')->where('id' ,$id)->update(
            array('fullname'=>''.$fullName.'','sex'=>''.$sex.'','birth'=>''.$birth.'',
                'phone'=>''.$phone.'','email'=>''.$email.'','address'=>''.$address.'',
                'username'=>''.$userName.'', 'password'=>''.$password.'')
        );
    }

    public static function rolesUpdateCustomer($id)
    {
        return array(
            'fullname'           =>'required',
            'sex'                => 'required',
            'birth'              =>'required',
            'phone'              => 'required|unique:customer,phone,'. $id,
            'email'      => 'required|unique:customer,email,'. $id,
            'username'           => 'required|unique:customer,username,' . $id,
            'password'           =>'required',
            'address'            =>'required',

        );
    }
    public static function rolesStoreCustomer($phone ,$email,$username)
    {
        return array(
            'fullname'           =>'required',
            'sex'                => 'required',
            'birth'              =>'required',
            'phone'              =>Rule::unique('customers')->where(function ($query) use ($phone) {
                return $query->where('phone', $phone);
            }),
            'email'      =>  Rule::unique('customers')->where(function ($query) use ($email) {
                return $query->where('email', $email);
            }),
            'username'           =>  Rule::unique('customers')->where(function ($query) use ($username) {
                return $query->where('username', $username);
            }),
            'password'           =>'required',
            'address'            =>'required',
        );
    }
    public static function  mssg(){
        return array(
            'fullname.require' =>'h??? v?? t??n kh??ng ???????c ????? tr???ng',
            'sex.require'      =>'b???n ch??a ch???n gi???i t??nh',
            'birth.require'    =>'b???n ch??a ch???n ng??y th??ng n??m sinh',
            'phone.unique'=>'s??? ??i???n tho???i c???a b???n b??? tr??ng ',
            'phone.required'=>'s??? ??i???n tho???i kh??ng ???????c ????? tr???ng ',
            'email.unique'=>'email c???a b???n ???? ???????c s??? d???ng ',
            'email.required'=>'email kh??ng ???????c ????? tr???ng ',
            'username.unique' =>'T??n ????ng nh???p c???a b???n ???? ???????c s??? d???ng ',
            'username.required'=>'t??n ????ng nh???p  kh??ng ???????c ????? tr???ng ',
            'password.required' =>'m???t kh???u kh??ng ???????c ????? tr???ng',
            'address.require' =>'?????a ch??? kh??ng ???????c ????? tr???ng',
        );
    }

}
