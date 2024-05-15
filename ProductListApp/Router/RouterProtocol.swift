//
//  RouterProtocol.swift
//  ProductListApp
//
//  Created by Miguel Castellanos on 13/05/24.
//
import UIKit

protocol RouterProtocol: AnyObject {
    var childCoordinators: Int { get }
    
    func push(_ vc: UIViewController, isAnimated: Bool, withCoordinator: CoordinatorProtocol)
    func pop(isAnimated: Bool)
}
