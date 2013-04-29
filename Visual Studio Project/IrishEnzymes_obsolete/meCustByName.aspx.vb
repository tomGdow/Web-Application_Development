﻿
Imports System.Data.OleDb

Partial Class meCustByName
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    <System.Web.Script.Services.ScriptMethod(), System.Web.Services.WebMethod()>
    Public Shared Function SearchCustomers(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As OleDbConnection = New OleDbConnection
        conn.ConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=|DataDirectory|enzymeDatabase.mdb;"
        Dim cmd As OleDbCommand = New OleDbCommand
        cmd.CommandText = "select Distinct SupplierName from Suppliers where" & _
        " SupplierName like @SearchText + '%'"
        cmd.Parameters.AddWithValue("@SearchText", prefixText)
        cmd.Connection = conn
        conn.Open()
        Dim customers As List(Of String) = New List(Of String)
        Dim sdr As OleDbDataReader = cmd.ExecuteReader
        While sdr.Read
            customers.Add(sdr("SupplierName").ToString)
        End While
        conn.Close()
        Return customers
    End Function

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

    End Sub
End Class
