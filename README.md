# azurepolicyvm


azurerm_policy_set_definition: policy set defination use to set policy initiative. Here, In this function we are reviewing if the policy is enabled or not. If custom policy not enabled, we have set flag that will be enable.

azurerm_policy_definition: The policy definitions for the policy set definition. This is a json object representing the bundled policy definitions. Here, we have set necessory modules inside the fuction.
Manages a policy rule definition on a management group or your provider subscription. Policy definitions do not take effect until they are assigned to a scope using a Policy Assignment

azurerm_subscription_policy_assignment: Configures the specified Policy Definition at the specified Scope. Also, Policy Set Definitions are supported. Inside this, we need to add all necessory details those are required to configure policy.


We have used this module with taking/caling necessory details with regards to enable policy for checking VM monitoring. Here in the description, we have added each module defination so that we can use them individually.
The standard module structure looks as follows:
-  main.tf, variable.tf, Files configuring a minimal module. Apart from main.tf, more complex modules may have additional resource configuration files from where we are calling barings module.

Custom Policy definitions are created using the azurerm_policy_definition resource and built-in policies are imported using the azurerm_policy_definition data resource. Both resources are included in the corresponding initiatives Terraform configuration file; unless they are shared across initiatives, in which case they are defined in the main.tf file.

It is important to note that policy data resource should be imported using its policy name (as opposed to they displayName), since the displayName is not unique and it may change, whereas the name is always unique and the same unless the policy is deleted. In the configuration, we kept the displayName commented out as it describes the policy definition being imported.

In a Terraform configuration, when an azurerm_policy_definition resource is referenced from an azurerm_policy_set_definition as per use used policy initiative for testing the module.





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
