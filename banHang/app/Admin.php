<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Auth\Authenticatable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;


class Admin extends Model implements AuthenticatableContract
{
    use Notifiable;
    use Authenticatable;
    protected $table = 'admins';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function store_save($fullName, $sex, $birth, $phone, $identity_card, $address, $userName, $access, $password)
    {
        $nhanVien = new Admin();
        $nhanVien->fullname = $fullName;
        $nhanVien->sex = $sex;
        $nhanVien->birth = $birth;
        $nhanVien->phone = $phone;
        $nhanVien->identity_card = $identity_card;
        $nhanVien->address = $address;
        $nhanVien->username = $userName;
        $nhanVien->access = $access;
        $nhanVien->password = $password;
        return $nhanVien->save();
    }
    public function updateSave($id,$fullName, $sex, $birth, $phone, $identity_card, $address, $userName, $access, $password)
    {
        return DB::table('admins')->where('id' ,$id)->update(
          array('fullname'=>''.$fullName.'','sex'=>''.$sex.'','birth'=>''.$birth.'',
              'phone'=>''.$phone.'','identity_card'=>''.$identity_card.'','address'=>''.$address.'','username'=>''.$userName.'',
              'access'=>''.$access.'','password'=>''.$password.''
              )
        );
    }

    public static function rolesUpdate($id)
    {
        return array(
            'fullname'           =>'required',
            'sex'                => 'required',
            'birth'              =>'required',
            'phone'              => 'required|unique:admins,phone,'. $id,
            'identity_card'      => 'required|unique:admins,identity_card,'. $id,
            'username'           => 'required|unique:admins,username,' . $id,
            'password'           =>'required',
            'address'            =>'required',
            'access'             =>'required',
        );
    }
    public static function rolesStore($phone ,$identity_card,$username)
    {
        return array(
            'fullname'           =>'required',
            'sex'                => 'required',
            'birth'              =>'required',
            'phone'              =>Rule::unique('admins')->where(function ($query) use ($phone) {
                    return $query->where('phone', $phone);
                }),
            'identity_card'      =>  Rule::unique('admins')->where(function ($query) use ($identity_card) {
                    return $query->where('identity_card', $identity_card);
                }),
            'username'           =>  Rule::unique('admins')->where(function ($query) use ($username) {
                    return $query->where('username', $username);
                }),
            'password'           =>'required',
            'address'            =>'required',
            'access'             =>'required',
        );
    }
    public static function  mssg(){
        return array(
            'fullname.required' =>'h??? v?? t??n kh??ng ???????c ????? tr???ng',
            'sex.required'      =>'b???n ch??a ch???n gi???i t??nh',
            'birth.required'    =>'b???n ch??a ch???n ng??y th??ng n??m sinh',
            'phone.unique'=>'s??? ??i???n tho???i c???a b???n b??? tr??ng ',
            'phone.required'=>'s??? ??i???n tho???i kh??ng ???????c ????? tr???ng ',
            'identity_card.unique'=>'s??? ch???ng minh c???a b???n b??? tr??ng ',
            'identity_card.required'=>'S??? ch???ng minh kh??ng ???????c ????? tr???ng ',
            'username.unique'=>'T??n ????ng nh???p ???? ???????c s??? d???ng',
            'username.required'=>'T??n ????ng nh???p kh??ng ???????c ????? tr???ng ',
            'password.required' =>'m???t kh???u kh??ng ???????c ????? tr???ng',
            'address.required' =>'?????a ch??? kh??ng ???????c ????? tr???ng',
            'access.required' =>'b???n ch??a ch???n quy???n cho t??i kho???n',
        );
    }


}
