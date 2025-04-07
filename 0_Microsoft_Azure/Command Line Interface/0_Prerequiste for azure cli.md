### Prerequiste to use azure using Windows CLI (Command Prompt)

1. A minimum of free trail account with Contributor role in Azure portal ([Steps to create free account  ](https://github.com/SukhbirSinghKhalsa/devops/blob/main/Microsoft%20Azure/prerequistes.md))

Q. what is Contributor role?   
>→ Contributor role is access role where a user has all the rights to create, use, update, delete all the resources in azure acount, only he cannot create a new users or delete exisiting users.

 Q. How to check your assigned role in azure portal?   
> 1. Visit [azure portal](https:///www.portal.azure.com) by typing portal.azure.com in your browser, and sigin with your user email and password provided by your company or organization
> 2. In the portal search bar, type `Subscriptions`, and hit enter, you can see a key like icon for it.  <img src="https://github.com/user-attachments/assets/80f234c7-c591-4320-8318-cdfcf84c6ec6" alt="subscription-icon" width="30" height=30/>
> 3. For trial account, you can see  `Free Trail` subscription, click on it
> 4. Now look for `Access Control(IAM)`, click on it
> 5. Next, you can see `check my access` button, click on it to see your assigned role<br/><br/>
![image](https://github.com/user-attachments/assets/4e64ea43-d66d-4228-930a-1fe9bc118a7c)

3. Once you have proper access with your email and password to access Azure portal, Next
4. Download the Azure Cli using one of following methods:
[Download Azure CLI here](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)   

- for windows OS you have 4 ways to install it, [Download Azure CLI for Windows](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-windows?pivots=msi)
  1. Downloading the MSI (Microsoft Installer file) [Preferred way]
  2. Dowloading Zip file
  3. Through Windows Powershell
  4. WinGet (windows package manager)
4. once Installed in your system, open the command prompt and type
   ```bash
   az --version
   ```
   It will display the version with additonal details about your azure cli, refer image
   ![image](https://github.com/user-attachments/assets/65e62314-cc7c-42a3-8938-c9ee015288fa)