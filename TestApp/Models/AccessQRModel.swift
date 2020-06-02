//
//  AccessQRModel.swift
//  TestApp
//
//  Created by softtek on 30/05/20.
//  Copyright © 2020 softtek. All rights reserved.
//

/*
 {
     "data": {
         "idEmployee": 1,
         "issuedDate": "2020-06-01T13:24:44",
         "qrCodeBase64": "iVBORw0KGgoAAAANSUhEUgAAAMgAAADIAQAAAACFI5MzAAACAElEQVR42u2YwY7DMAhEkfxbSPw6Er+F5J3BSZQe9gaHXTWq2sTvYGMPA6ns3y75kr9LXGTl2uFibvgxDgyQwAcXIICvqIEJgqe0wANvFm6JZ4ivTRjhqpMkAUXkGh4ihLpOpI5D+9jrPkJBxPv60E4fqQtbiiEoxHD3kQttBMH5qi9uLp4VGztAEr+RqojPcXA4PtE1QCCPOjKoAyeIuVOuFfQSJhMgVqBUBwIV2xNElFNyM6MmR45NEIzR+NIYLKE8SmwlbskYszTC2d1uJbYSjCsSGFpnGkMrNI4BEjRy5jEUkmJpu9bQTjCmJUPKpHL45SG9hCmVFSb2Nh8lNpMqRlQftpQPCDcGCM+qiiAE4rUWERsgVIhwME9lssqAfkJ1wCpKfpXHaY92OgnLHbUXxyz8sop2krWR6LrUkhYeTOYBcpoSpccyrUrvMUBYYqF5ZjDmpvetuwa3EpYjFibEWpYHJ7xrVi+ht+rpGLyK7I4YICwUWZkFazL2389etxI6np1eaFdj53cFbCanx6fSWTIoErUJ4mx9TluCOLmK2AOEF5vtirgM3V+dah+pjpidQ9AF4XrUxwCJy8xZKY73uY0Q9o9WK6gKyHS2IcLWATEmE+x67ZshVTQ2q8VVAAfIrrfwaoPOSvTJhU5SCsl63edbpZy60U++/9X8M/IDbzZnFLfaxw4AAAAASUVORK5C",
         "color": "WHITE",
         "gdc": "AGS",
         "cds": "CDS A",
         "seat": "A01",
         "lunchSchedule": "1 - 2 PM"
     },
     "message": null
 }
*/
import Foundation

// MARK: - AccessQRModel
struct AccessQRModel: Codable {
    let data: DataClass?
    let message: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let gdc, cds, seat, lunchSchedule, email, issuedDate, qrCodeBase64, color: String?
}
