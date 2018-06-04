//
//  ViewController.swift
//  IceCacheSample
//
//  Created by Gua on 2018/5/31.
//  Copyright © 2018 Gua. All rights reserved.
//

import UIKit
import IceCache

class ViewController: UIViewController {
    
    let cache: LinkedMap<String, Int> = LinkedMap<String, Int>(5)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cache.set("a", value: 11)
        print(cache.description)
        
        cache.set("b", value: 22)
        print(cache.description)
        
        cache.set("c", value: 33)
        print(cache.description)
        
        cache.set("d", value: 44)
        print(cache.description)
        
        cache.set("e", value: 55)
        print(cache.description)
        
        cache.set("f", value: 66)
        print(cache.description)
        
        print(cache.get("b") ?? "No Data")
        print(cache.description)
    }

}

