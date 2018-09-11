//
//  DestinationsInnerProtocol.swift
//  Natoure
//
//  Created by Marco Antonio Martínez Gutiérrez on 05/09/18.
//  Copyright © 2018 Marco Antonio Martínez Gutiérrez. All rights reserved.
//

import Foundation
import UIKit

protocol DestinationsMapToParentProtocol: class {
    func itemClicked(id:Int)
}

protocol DestinationsParentToMapProtocol: class {
    func setMapAICPoints(_ aicList:[AICResume] )
}

protocol DestinationsListToParentProtocol: class {
    
}

protocol DestinationsParentToListProtocol: class {
    
}
