.PHONY: create_app create_package_template

# Comando para criar um Flutter app dentro de src/apps/
create_app:
	@mkdir -p src/apps/$(name)
	@make create_package_template package=src/apps name=$(name)

# Comando para criar um Flutter package dentro de src/packages/
create_package:
	@mkdir -p src/packages/$(name)
	@make create_package_template package=src/packages name=$(name)

# Comando para criar um Flutter package (template) dentro de uma pasta específica
create_package_template:
	@flutter create --template=package --no-pub $(package)/$(name)
	@melos bootstrap
