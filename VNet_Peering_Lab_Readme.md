### Objectives of VNet-Peering-Lab

1. Create 2 Resource Groups [One for Primary and another for Secondary]

2. Create VNets in each of those RGs and also create 1 Subnet in each of those VNets

3. Deploy Linux VM on to the Primary RG and WindowsVM on to the Secondary RG

4. Creat Azure Key Vault and create separate Secrets for accessing the LinuxVM and WindowsVM

5. Use those secrets as admin_passwords for the VMs accordingly

6. Implement Peering connection between the Primary and the Secondary VNets

7. Define Traffic Rules such that only SSH allowed from Internet to the LinuxVM [Use Azure Public IP to do so]

8. Define Traffic Rules such that only ICMP and RDP is allowed from the Linux VM [or from the Peered Network]

9. Deploy VM Extension for WindowsVM to open ICMP by default otherwise, the ICMP will not work

10. Test the connection
   - From the terminal, use `ssh adminuser@LinuxVMPubIP` Log in to Linuxvm and Use the LinuxVMSecret from the Portal as the password to login [You should be able to successfully login to the LinuxVM]
   - use `ping WindowsVMPrivateIP` and see if this works [You should be able to send/receive data to/rom the WindowsVM successfully]

   ![Ping to WindowsVM](/images/PingtoWindowsVM.png)

11. Try to RDP in to the WindowsVM using any RDP tool and it should time-out as the access from Internet is limited through the NSG rules defined for the WindowsVM 

Once this is done, use `terraform destroy --auto-approve` to free up the Resources from the portal when you are ready