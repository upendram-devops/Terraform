"Terraform meta-arguments are special arguments used to control how Terraform manages infrastructure resources and modules. 
The main meta-arguments are count, for_each, depends_on, lifecycle, provider, and providers. For example, count creates multiple instances, 
for_each creates resources from a map or set, depends_on defines dependencies, and lifecycle controls resource behavior."

Quick memory trick
count → How many?
for_each → Which items?
depends_on → What must happen first?
lifecycle → How should Terraform manage the resource?
provider → Which provider configuration?
providers → Which provider configurations go into a module?
