<img src="img/logo.png" alt="FsFTP Server" title="FsFTP Server" align="right">
<h1>FsFTP Server (Fast and Secure FTP Server)</h1>

<i>Ce fichier existe en plusieurs langues. <a href="LISEZ-MOI.md"><u>Cliquez ici pour le lire en Français</i></a></i>

<hr>

<i>FsFTP Server (<b>F</b>ast and <b>S</b>ecure <b>FTP</b> Server) is a Highly configurable Free FTP & FTPS server compatible with Windows and Linux</i><br>

> Screenshot <a href="SCREENSHOT.md">click here</a><br>
<!-- > Demo on line <a href="DEMO-EN.md">click here</a><br> //-->
> Installation under linux <a href="INSTALL-LINUX.md">click here</a><br>
> Installation under freebsd <a href="INSTALL-FREEBSD.md">click here</a><br>
> Installation under Windows <a href="INSTALL-WINDOWS.md">click here</a><br><br>


<img src="img/touchicon.png" hight="50" width="50" alt="FsFTP Server" title="FsFTP Server" align="left">
<h2>FsFTP Server</h2>

<li><b><i>Full supports secure SSL and TLS connections (in Explicit and Implicit). FTP and FTPS</i></b></li>

<li><b><i>Multi-lang (English and French) Admin Control Panel to configure server</i></b></li>

<li><b><i>Max Connections</i></b></li>
Max number of control connections to accept<br><br>

<li><b><i>Max Connections Per User</i></b></li>
Max number of control connections to accept for each user (per same user)<br><br>

<li><b><i>Max Connections Per Ip</i></b></li>
Max number of control connections to accept for each IP Address (per same IP Address)<br><br>

<li><b><i>IPs To ban</i></b></li>
Connections from these IPs will be rejected<br><br>

<li><b><i>Idle Timeout</i></b></li>
Maximum inactivity time, in seconds, before disconnecting<br><br>

<li><b><i>Anonymous account compatible</i></b></li>

<li><b><i>Authenticated FTP access</i></b></li>

<li><b><i>Complete implementation of current RFCs</i></b></li>

<li><b><i>ASCII or binary type file transfers</i></b></li>

<li><b><i>Active or passive mode file transfers</i></b></li>

<li><b><i>Security features: chroot, resource limits, tainting</i></b></li>

<li><b><i>IPv4 and IPv6 compatible</i></b></li>

<li><b><i>FTP and FTPS</i></b></li>

<li><b><i>Multiple domains</i></b></li>

<li><b><i>Multiple users</i></b></li>

<li><b><i>Users don't need a real system account</i></b></li>

<li><b><i>Domain aliasing</i></b></li>

<li><b><i>Account aliasing</i></b></li>

<li><b><i>Remote administration</i></b></li>

<li><b><i>Advanced Logging (Xferlog compatible)</i></b></li>

<li><b><i>Multi platform ( Windows All version, Linux [ Debian, Ubuntu, Fedora, FreeBSD, OpenSuse, Centos, Arch Linux, Red Hat, etc... ], MacOs )</i></b></li><br>

![FsFTP Server](img/domains.png?raw=true)<br><br><br>

<img src="img/touchicon.png" hight="50" width="50" alt="FsFTP Server" title="FsFTP Server" align="left">
<h2>Unlimited Account</h2>

<b><i>For each account you can configure :</i></b>

<li><b><i>Account aliasing</i></b></li>

<li><b><i>Status</i></b></li>
Enable/disable account<br><br>

<li><b><i>Expiration Date</i></b></li>

<li><b><i>Force secure connections to this account</i></b></li>
FsFTP Server supports secure SSL and TLS connections (in Explicit and Implicit), so you can require connections to this account to be secure, so any connections that are not encrypted will be rejected. Useful if this account will share confidential data.<br><br> 	

<li><b><i>User Directory</i></b></li>
Each account can have its own directory<br><br>

<li><b><i>File Permissions</i></b></li>
- <b>Read</b>: can Read (download) file/contents<br>
- <b>New</b>: Can Create a new file or write contents in existent files<br>
- <b>Delete</b>: Can Delete Files<br>
- <b>Rename</b>: Can rename Files<br>
- <b>Chmod</b>: Can apply Chmod<br>
- <b>Append</b>: Can append contents in an existent file<br><br>

<li><b><i>File Access Permissions</i></b></li>
Access rights (<b>CHMOD</b>) manage what actions users have the right to perform on files (read, write, and execute)<br><br>

<li><b><i>Directory Permissions</i></b></li>
- <b>Create</b>: Can Create a new Directory or Subfolder<br>
- <b>Delete</b>: Can Delete a Directory or Subfolder and their contents<br>
- <b>Rename</b>: Can rename directory and subfolder<br>
- <b>Chmod</b>: Can apply Chmod<br>
- <b>List</b>: will list all files/directory for this account<br><br>

<li><b><i>Directory Access Permissions</i></b></li>
Access rights (<b>CHMOD</b>) manage what actions users have the right to perform on Directories (read, write, and execute)<br><br>

<li><b><i>Banned File Extension</i></b></li>
You can specify multiple values by separating them with a comma "<b>,</b>" Eg: "exe, bat, cmd, vb"<br><br>

<li><b><i>Allowed File Extension</i></b></li>
You can specify multiple values by separating them with a comma "<b>,</b>" Eg: "html, txt, doc, pdf"<br><br>

<li><b><i>Allowed IPs</i></b></li>
The account can only connect from these IPs. Any connection from an IP not listed here will be rejected<br><br>

<li><b><i>Account Login Times</i></b></li>
You can set restrictions on account login times.<br><br>

<li><b><i>Quota</i></b></li>
This restricts the user to a fixed amount of disk usage (disk quota control).<br><br>

<li><b><i>Maximum File Size</i></b></li>
Users will not be able to send files whose size exceeds this value.<br><br>

<li><b><i>Force Display Hidden Files and Directories</i></b></li>
By default, files and directories with the hidden attribute (which start with a dot "." eg: .htaccess, .passwd, .file, etc ...) will not be displayed to users in the explorer. You can force their display by setting this directive to True<br><br>	

<li><b><i>Force Display Temporary Files and Directories</i></b></li>
By default, files and directories that end with the ~ "tilde" character (eg: tmp~, newFile~, myDirectory~ ...) will not be displayed to users in the explorer. You can force their display by setting this directive to Enable<br><br>	

<li><b><i>User and Group</i></b></li>
User/Group: The name (or #number) of the User/Group to run this account as.<br>
These options are useful if you use eg suEXEC and/or suPHP or for web-hosting<br><br>


<li><b><i>Account Logging</i></b></li>
Enable/Disable logs for this account. All activities will be saved as <b>Xferlog format</b><br><br>

<li><b><i>Save logs separately</i></b></li>
Save the logs for this user separately<br><br>


<li><b><i>Anti Brute-Force attack</i></b></li>
FsFTP Server has an Anti Brute-Force attack<br><br>

![FsFTP Server](img/accounts.png?raw=true)<br><br><br>

<img src="img/touchicon.png" hight="50" width="50" alt="FsFTP Server" title="FsFTP Server" align="left">
<h2>A message from Lassaad ZOUARI, Creator of FsFTP Server</h2>

FsFTP is one of the most secure and easy-to-use FTP servers in its class. It's 100% free, with no ads and no hidden fees.<br>
<br>
As you know, advertising is the most used tool to make your site or project profitable. But I do not want it! Likewise, I could have started a commercial business and sold advertising space or sold software licenses. But I decided to do something different.<br>
<br>
But server rentals, hosting, thousands of hours of programming, maintenance, development etc ... We are expensive. We work hard to offer you an efficient and free solution. Today, we fulfill our mission but we need your contribution. If every person reading this message gave, our fund raising would be completed in just one hour! I thank you for making a donation of 5, 20, 50 or the amount of your choice so that we can preserve this project.<br>
<br>
To make a donation, <a href="https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=PX5B8E9T5RRGL&source=url" target="_blank">click here</a><br>
<br>
Thank you :) <br><br>

<img src="img/touchicon.png" hight="50" width="50" alt="FsFTP Server" title="FsFTP Server" align="left">
<h2>License</h2>
FsFTP server is free <u>software, without ads and without hidden costs</u>. You can use and distribute it in accordance with our <a href="https://hotscripts.fr/?f=conditions&l=en"><u>license</u></a><br><br>

<img src="img/touchicon.png" hight="50" width="50" alt="FsFTP Server" title="FsFTP Server" align="left">
<h2>Lins</h2>
<li>https://hotscripts.fr</li>
<li>https://froxlor.org/</li>

<hr><br>

![FsFTP Server](img/add-acc.png?raw=true)<br><br>

<br><br>
