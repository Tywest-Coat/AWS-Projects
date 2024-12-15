# Multi-Cloud Identity and Access Management (IAM) Framework

## Overview

This project demonstrates how to integrate **AWS IAM** and **Azure Active Directory (Azure AD)** to create a **multi-cloud Identity and Access Management (IAM) framework**. The goal is to securely manage user access across both AWS and Azure environments, leveraging **SAML-based federated access** and implementing security best practices such as **MFA**, **least privilege** access control, and **conditional access policies**.

Link to Video Outlining Steps:
https://youtu.be/S0_wozfkBXY



[![Watch the video](https://img.youtube.com/vi/S0_wozfkBXY/hqdefault.jpg)](https://youtu.be/S0_wozfkBXY)



This guide provides step-by-step instructions to configure **AWS SSO** integration with **Azure Active Directory (Azure AD)** using SAML-based authentication.

## Prerequisites

Before starting, ensure that you have:
- Administrative access to both **Azure AD** and **AWS Management Console**.
- An active **Azure AD** subscription.
- AWS SSO enabled in your AWS environment.

## Step 1: Add AWS SSO to Azure AD

1. Sign in to the **Azure Portal**.
2. Go to **Azure Active Directory** > **Enterprise applications**.
3. Select **New application** and search for **AWS Single Sign-On** in the gallery.
4. Click **AWS Single Sign-On** and select **Create**.

## Step 2: Configure Azure AD SAML-based Single Sign-On

1. In the newly created AWS SSO application in Azure AD, navigate to the **Single sign-on** section.
2. Select **SAML** as the sign-on method.
3. Configure the following fields:
   - **Identifier (Entity ID)**: `urn:amazon:webservices`
   - **Reply URL (Assertion Consumer Service URL)**: `https://<AWS SSO URL>/signin-saml`
4. Download the **Federation Metadata XML** from this page. You’ll upload this to AWS later.

## Step 3: Configure AWS SSO

1. In the **AWS Management Console**, go to **AWS SSO**.
2. Under **Settings**, select **Enable identity source** and set **Azure AD** as the identity provider.
3. Upload the **Federation Metadata XML** you downloaded from Azure AD.
4. Save the settings.

## Step 4: Assign Users and Groups in Azure AD

1. In **Azure AD**, navigate to the **AWS Single Sign-On** application.
2. Under **Users and Groups**, click **Add user/group**.
3. Assign the users or groups who need access to AWS.

## Step 5: Configure AWS SSO Roles

1. In the **AWS Management Console**, go to **AWS SSO** > **AWS Accounts**.
2. Choose the AWS account and click **Assign Users**.
3. Assign the appropriate roles to users or groups from Azure AD.

## Step 6: Test the Configuration

1. Sign in to the **MyApps portal** in Azure AD as an assigned user.
2. Select the **AWS SSO** application.
3. Verify that you are automatically signed into AWS via Single Sign-On.

## Troubleshooting

- Ensure that the **Identifier (Entity ID)** and **Reply URL** are correctly configured.
- Verify that the correct users and groups are assigned in Azure AD.
- Check the SAML configuration in both Azure AD and AWS for any mismatches.

## Additional Resources

- [Microsoft Docs: AWS Single Sign-On with Azure AD](https://learn.microsoft.com/en-us/entra/identity/saas-apps/aws-single-sign-on-tutorial)

