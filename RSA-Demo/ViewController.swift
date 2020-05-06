//
//  ViewController.swift
//  RSA-Demo
//
//  Created by payne on 2020/5/6.
//  Copyright © 2020 marcus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.加载公钥
        RSACryptor.shared()?.loadPublicKey(Bundle.main.path(forResource: "rsacert.der", ofType: nil))
        
        //2.加载私钥
        RSACryptor.shared()?.loadPrivateKey(Bundle.main.path(forResource: "p.p12", ofType: nil), password: "123456")
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let str = "hello"
        //1.加密
        let result = RSACryptor.shared()?.encryptData(str.data(using: .utf8))
        print("加密的结果：\(result?.base64EncodedString())")
        
        //2.解密
        let jiemi = (RSACryptor.shared()?.decryptData(result))!
        print("解密的结果：\(String(data: jiemi, encoding: .utf8))")
        
    }

}

