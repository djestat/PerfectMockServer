//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import PerfectHTTPServer

let server = HTTPServer()
let authController = AuthController()
var routes = Routes()

routes.add(method: .post, uri: "/register", handler: authController.register)

server.addRoutes(routes)
server.serverName = "127.0.0.1"
server.serverPort = 8181

do {
    try server.start()
} catch {
    fatalError("Network error - \(error)")
}

