//
//  LocationManager.swift
//  ProductListApp
//
//  Created by Miguel Angel Castellanos salamanca on 15/05/24.
//

import CoreLocation

struct CountryCode {
    public static var countryCodes = ["Chile": "LC",
                                      "Dominicana": "RD",
                                      "Mexico": "MLM",
                                      "Paraguay": "PY",
                                      "Panamá": "PA",
                                      "Ecuador": "EC",
                                      "Argentina": "LA",
                                      "CostaRica": "CR",
                                      "Honduras": "HN",
                                      "Uruguay": "LU",
                                      "Nicaragua": "NI",
                                      "Colombia": "CO",
                                      "Cuba": "CU",
                                      "Bolivia": "BO",
                                      "Perú": "PE",
                                      "Venezuela": "LV",
                                      "ElSalvador": "SV",
                                      "Brasil": "LB",
                                      "Guatemala": "GT"]
}

extension CLLocation {
    func fetchCityAndCountry(completion: @escaping (_ country:  String?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first?.country, $1) }
    }
}

