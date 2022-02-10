# azurepolicyvm

1: Funtion to set policy initiative defination.

azurerm_policy_set_definition: policy set defination use to set policy initiative. Here, In this function we are reviewing if the policy is enabled or not. If custom policy not enabled, we have set flag that will be enable.

In the first stage at "cutom_policy_enabled ? 0 : 1" we are checking the azure custom policy is being enabled or not, so that we can attach them with build in policies. Using exist_policy variable name. So that during caling the module, anyone can use existing policy as well.


2: Manages a policy rule definition on a management group or your provider subscription in which we are assigning policy.

azurerm_policy_definition: The policy definitions for the policy set definition. This is a json object representing the bundled policy definitions. Here, we have set necessory modules inside the fuction. Manages a policy rule definition on a management group or your provider subscription. Policy definitions do not take effect until they are assigned to a scope using a Policy Assignment
display_name: A friendly display name to use for this Policy Assignment. Changing this forces a new resource to be created. Here we are passing display name and description of the policy at single using collaps. Such that we can set policy Display name and Description at a single run time.
description:  A description to use for this Policy Assignment. Changing this forces a new resource to be created.
policy_type:  This will be defines policy type.
mode: Can be set to 'true' or 'false' to control whether the assignment is enforced (true) or not (false).
management_group_name: The name which should be used for this Policy Assignment.
policy_rule: This will be the rule where policy rules can be defined.
parameters: A JSON mapping of any Parameters for this Policy which will be inject in the Azure account.


3. 
azurerm_subscription_policy_assignment: Configures the specified Policy Definition at the specified Scope. Also, Policy Set Definitions are supported. Inside this, we need to add all necessory details those are required to configure policy.

policy_assignments:    Map with maps to configure assignments. Map key is the name of the assignment. Each parameter will be enter in the string.
policy_definition_id:  This attribute is the ID of the Policy Definition.
subscription_id:       This will desines the subscription where we will be assiging the policy.
location:              The Azure location where this policy assignment should exist. This is required when an Identity is assigned.
parameters:   This will defines each policy parameters.







Summary:

We have used this module with taking/caling necessory details with regards to enable policy for checking VM monitoring. Here in the description, we have added each module defination so that we can use them individually.
The standard module structure looks as follows:
-  main.tf, variable.tf, Files configuring a minimal module. Apart from main.tf, more complex modules may have additional resource configuration files from where we are calling barings module.

Custom Policy definitions are created using the azurerm_policy_definition resource and built-in policies are imported using the azurerm_policy_definition data resource. Both resources are included in the corresponding initiatives Terraform configuration file; unless they are shared across initiatives, in which case they are defined in the main.tf file.

It is important to note that policy data resource should be imported using its policy name (as opposed to they displayName), since the displayName is not unique and it may change, whereas the name is always unique and the same unless the policy is deleted. In the configuration, we kept the displayName commented out as it describes the policy definition being imported.

Custom Policy definitions are created using the azurerm_policy_definition resource and built-in policies are imported using the azurerm_policy_definition data resource. Both resources are included in the corresponding initiatives Terraform configuration file; unless they are shared across initiatives, in which case they are defined in the main.tf file.

Azure policies are defined as JSON, where we can define structurised json format for the policy. With the necessory perameter, we can define in the main.tf file and call barings template where necessory things required.




## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| policy\_assignments | Map with maps to configure assignments. Map key is the name of the assignment. | <pre>map(object({<br>    display_name  = string,<br>    description   = string,<br>    scope         = string,<br>    parameters    = string,<br>    identity_type = string,<br>    location      = string,<br>  }))</pre> | n/a | yes |
| policy\_description | The description of the policy definition. | `string` | `""` | no |
| policy\_display\_name | The display name of the policy definition. | `string` | n/a | yes |
| policy\_mgmt\_group\_name | Create the Policy Definition at the Management Group level | `string` | `null` | no |
| policy\_mode | The policy mode that allows you to specify which resource types will be evaluated. The value can be `All`, `Indexed` or `NotSpecified`. | `string` | `"All"` | no |
| policy\_name | The name of the policy definition. Defaults generated from display name | `string` | `""` | no |
| policy\_parameters\_content | Parameters for the policy definition. This field is a json object that allows you to parameterize your policy definition. | `string` | n/a | yes |
| policy\_rule\_content | The policy rule for the policy definition. This is a json object representing the rule that contains an if and a then block. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| policy\_assignment | Azure policy assignments map |
| policy\_definition\_id | Azure policy ID |
