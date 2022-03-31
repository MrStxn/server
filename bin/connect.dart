// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library sql_server_socket_test;

import '../DartClient/lib/sqlconnection.dart';
import '../DartClient/lib/table.dart';
import '../DartClient/lib/sqlformats.dart';

import 'dart:async';

// import "package:guinness/guinness.dart";

void main()
{
   defineSpecs().then((_){});
}   

Future defineSpecs() async
{  
   /// creates a common database where to perform all tests
  //  var conn = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=master;Trusted_Connection=yes;");
   var conn = new SqlConnection("Server=localhost;Database=document_center;User=root;Password=password;");
   
   await conn.open();
   await conn.execute("IF EXISTS (SELECT name FROM master.sys.databases WHERE name = 'sql_server_socket_test_db') DROP DATABASE sql_server_socket_test_db");
   await conn.execute("CREATE DATABASE sql_server_socket_test_db");
   await conn.execute("USE sql_server_socket_test_db");
   await conn.execute("CREATE TABLE Customers (Id INT IDENTITY PRIMARY KEY, Name VARCHAR(64), Age INT, Born DATETIME, HasWebSite BIT NOT NULL)");
   await conn.execute("INSERT INTO Customers (Name, Age, HasWebSite) VALUES ('Bob' ,33, 0)");
   await conn.execute("INSERT INTO Customers (Name, Age, HasWebSite, Born) VALUES ('Tom' ,42, 1, ${sqlDate(new DateTime(1972,05,03))})");
   await conn.execute("INSERT INTO Customers (Name, Age, HasWebSite) VALUES ('Mary',18, 1)");
   await conn.close();
      
  //  conn = new SqlConnection("Server=localhost\\SQLEXPRESS;Database=sql_server_socket_test_db;Trusted_Connection=yes;");
   conn = new SqlConnection("Server=localhost;Database=document_center;User=root;Password=password;");
  return conn;
    
}
  
