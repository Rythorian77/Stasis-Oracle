Imports System.IO
Imports System.Management
Imports System.Net
Imports System.Text
Imports Microsoft.VisualBasic.Devices

Public Class Static_X
    Dim p() As Process
    Dim c As Process = Process.GetCurrentProcess()

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        WebBrowser1.Navigate("https://www.google.com/maps/@44.9019904,-68.6889562,3914m/data=!3m1!1e3?q=")
        WebBrowser2.Navigate("https://whatismyipaddress.com/")
        Timer2.Start()
        Location = New Point((Screen.PrimaryScreen.WorkingArea.Width / 2) - (Width / 2), ((Screen.PrimaryScreen.WorkingArea.Height / 2) - (Height / 2)))
        TextBox1.Font = New Font("Consolas", 11)
        TextBox1.ScrollBars = ScrollBars.Both
        Timer2.Enabled = True
        TextBox1.Clear()
        Dim NetstatInfo4 As New ProcessStartInfo
        NetstatInfo4.FileName = "C:\Windows\System32\Netstat.exe"
        NetstatInfo4.Arguments = ChrW(34) & "-r" & ChrW(34)
        NetstatInfo4.CreateNoWindow = True
        NetstatInfo4.UseShellExecute = False
        NetstatInfo4.RedirectStandardOutput = True
        Dim p4 As Process = Process.Start(NetstatInfo4)
        Dim IFaceListAndRoutes As New List(Of String)
        Do Until p4.StandardOutput.EndOfStream
            Dim Outputs As String = p4.StandardOutput.ReadLine
            IFaceListAndRoutes.Add(Outputs)
        Loop
        Dim Result As String = ""
        For i = 0 To IFaceListAndRoutes.Count - 1
            If IFaceListAndRoutes(i).Contains(" 0.0.0.0 ") Then
                Result = IFaceListAndRoutes(i)
            End If
        Next
        Result = Result.Replace(" ", "*|")
        Result = Result.Replace("|*", "")
        Result = Result.Replace("*", "")
        Dim Results() As String = Result.Split("|"c)
        TextBox1.AppendText("Your Network Gateway is - " & Results(3) & vbCrLf & "Your IP address is - " & Results(4))

        WebBrowser2.ScriptErrorsSuppressed = True
        WebBrowser1.ScriptErrorsSuppressed = True
        Dim watched As String = "C:\"
        Dim fsw As New FileSystemWatcher(watched)
        fsw.IncludeSubdirectories = True
        fsw.NotifyFilter = NotifyFilters.FileName Or NotifyFilters.LastWrite

        AddHandler fsw.Changed, AddressOf fsw_changed
        AddHandler fsw.Created, AddressOf fsw_changed
        AddHandler fsw.Deleted, AddressOf fsw_changed
        AddHandler fsw.Renamed, AddressOf fsw_changed
        fsw.EnableRaisingEvents = True

        KillHungProcess("Teams.exe") 'Put your process name here
        Timer1.Start()
    End Sub

    Private Sub fsw_changed(sender As Object, e As FileSystemEventArgs)

        setLabelTxt("Monitoring: " & e.FullPath, Label2)
    End Sub

    Public Shared Sub setLabelTxt(text As String, lbl As Label)
        If lbl.InvokeRequired Then
            lbl.Invoke(New setLabelTxtInvoker(AddressOf setLabelTxt), text, lbl)
        Else
            lbl.Text = text
        End If
    End Sub

    Public Delegate Sub setLabelTxtInvoker(text As String, lbl As Label)

    Public Sub KillHungProcess(processName As String)
        Dim psi As ProcessStartInfo = New ProcessStartInfo
        psi.Arguments = "/im " & processName & " /f"
        psi.FileName = "taskkill"
        Dim p As Process = New Process()
        p.StartInfo = psi
        p.Start()
    End Sub

    Public Sub CreationEventWatcherPolling()

        ' Create event query to be notified within 1 second of
        ' a change in a service
        Dim query As New WqlEventQuery(
            "__InstanceCreationEvent",
            New TimeSpan(0, 0, 1),
            "TargetInstance isa ""Win32_Process""")

        ' Initialize an event watcher and subscribe to events
        ' that match this query
        Dim watcher As New ManagementEventWatcher(query)

        Do
            Dim e As ManagementBaseObject =
                watcher.WaitForNextEvent()

            'block notepad
            If CType(e("TargetInstance"),
                    ManagementBaseObject)("Name").ToString = "Teams.exe" Then
                Process.GetProcessById((CType(e("TargetInstance"),
                    ManagementBaseObject)("Handle"))).Kill()
            End If
            If CType(e("TargetInstance"),
                   ManagementBaseObject)("Name").ToString = "MSTSC.exe" Then
                Process.GetProcessById((CType(e("TargetInstance"),
                    ManagementBaseObject)("Handle"))).Kill()
            End If

        Loop

        'Cancel the subscription
        watcher.Stop()

    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Application.Exit()
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Dim p() As Process = Process.GetProcessesByName("Teams")
        lblStatus.Text = If(p.Length > 0, "Teams is running.", "Teams isn't running.")

        Process.GetProcessesByName("MSTSC")
        lbl.Text = If(p.Length > 0, "Remote is running.", "Remote isn't running.")

    End Sub

    Public Sub getAvailableRAM()
        Dim CI As New ComputerInfo()
        Dim avl, used As String
        Dim mem As ULong = ULong.Parse(CI.AvailablePhysicalMemory.ToString())
        Dim mem1 As ULong = ULong.Parse(CI.TotalPhysicalMemory.ToString()) - ULong.Parse(CI.AvailablePhysicalMemory.ToString())
        avl = (mem / (1024 * 1024) & " MB").ToString() 'changed + to &
        used = (mem1 / (1024 * 1024) & " MB").ToString() 'changed + to &
    End Sub

    Private Sub Timer2_Tick(sender As Object, e As EventArgs) Handles Timer2.Tick
        Timer2.Stop()
        Dim arreyTag As New ArrayList
        For Each items As HtmlDocument In WebBrowser2.Document.GetElementsByTagName("td")
            arreyTag.Add(items.ActiveElement)
        Next
        lblIP.Text = ("Available Virtual Memory: " &
         My.Computer.Info.AvailableVirtualMemory)

        lblLatitude.Text = ("Available Physical Memory: " &
         My.Computer.Info.AvailablePhysicalMemory)

        lblLongitude.Text = ("UI Culture Name: " &
         My.Computer.Info.InstalledUICulture.DisplayName)

        lblCountry.Text = ("Operating System Name: " &
         My.Computer.Info.OSFullName)

        lblRegion.Text = ("Operating System Platform: " &
         My.Computer.Info.OSPlatform)

        lblCity.Text = ("Operating System Version: " &
         My.Computer.Info.OSVersion)

        lblProvider.Text = ("Win32_Keyboard")

        btnLatitude.PerformClick()
    End Sub

    Public Shared Function isConnected() As Boolean
        Try
            Dim addresslist As IPAddress() = Dns.GetHostAddresses("www.google.com")
            ' | ' addresslist holds a list of ipadresses to google
            ' | ' e.g  173.194.40.112                                       |
            ' | '                .116                                       |
            If addresslist(0).ToString().Length > 6 Then
                Return True
            Else
                Return False
            End If
        Catch ex As Sockets.SocketException
            ' | ' You are offline                   |
            ' | ' the host is unkonwn               |
            Return False
        Catch ex As Exception
            Return False
        End Try
    End Function

    Private Sub btnLatitude_Click(sender As Object, e As EventArgs) Handles btnLatitude.Click
        If lblLatitude.Text = String.Empty Or lblLongitude.Text = String.Empty Then
            MsgBox("Supply a latitude & Longitude value", MsgBoxStyle.Information, "Missing Data")
        End If

        Try
            Dim lat As String = String.Empty
            Dim lon As String = String.Empty
            Dim queryAddress As New StringBuilder()
            queryAddress.Append("https://www.google.com/maps/@44.9019904,-68.6889562,3914m/data=!3m1!1e3?q=")
            If lblLatitude.Text <> String.Empty Then
                lat = lblLatitude.Text
                queryAddress.Append(lat + "%2C")
            End If
            If lblLongitude.Text <> String.Empty Then
                lon = lblLongitude.Text
                queryAddress.Append(lon)
            End If

            WebBrowser1.Navigate(queryAddress.ToString())
        Catch ex As Exception
            MsgBox(ex.Message.ToString(), "Error")

        End Try
    End Sub

    Private Sub btnCity_Click(sender As Object, e As EventArgs) Handles btnCity.Click
        Try
            Dim city As String = String.Empty
            Dim queryAddress As New StringBuilder()
            queryAddress.Append("https://www.google.com/maps/@44.9019904,-68.6889562,3914m/data=!3m1!1e3?q=")
            If lblCity.Text <> String.Empty Then
                city = lblCity.Text.Replace(" ", "+")
                queryAddress.Append(city + "," & "+")
            End If
            WebBrowser1.Navigate(queryAddress.ToString)
        Catch ex As Exception
            MsgBox(ex.Message, "Error")

        End Try
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Process.Start("C:\Users\justin.ross\source\repos\Stasis-X\Stasis X\Stasis X\Resources\Rane.bat")

    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Process.Start("C:\Users\justin.ross\source\repos\Stasis-X\Stasis X\Stasis X\Resources\Radon.bat")
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        Process.Start("C:\Users\justin.ross\source\repos\Stasis-X\Stasis X\Stasis X\Resources\Morrayne.bat")
    End Sub

    Private Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Application.Exit()
    End Sub

    Private Sub Button6_Click(sender As Object, e As EventArgs) Handles Button6.Click
        Process.Start("C:\Users\justin.ross\source\repos\Stasis-X\Stasis X\Stasis X\Resources\krom.bat")
    End Sub

    Private Sub Button7_Click(sender As Object, e As EventArgs) Handles Button7.Click
        Process.Start("C:\Users\justin.ross\source\repos\Stasis-X\Stasis X\Stasis X\Resources\Cleanse.bat")
    End Sub

    Private Sub Button8_Click(sender As Object, e As EventArgs) Handles Button8.Click
        Process.Start("C:\Users\justin.ross\source\repos\Stasis-X\Stasis X\Stasis X\Resources\Utility.bat")
    End Sub

    Private Sub Button9_Click(sender As Object, e As EventArgs) Handles Button9.Click
        Process.Start("C:\Users\justin.ross\source\repos\Stasis-X\Stasis X\Stasis X\Resources\Network.bat")
    End Sub

End Class