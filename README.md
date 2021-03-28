# EasyAleert

EasyAleert is a simple Swift library for show native Alerts.

## Installation

Use the [Swift Package Manager](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) to install EasyAleert.

```bash
https://github.com/bryanbarreto/easy-alert
```

## Usage

```swift
import EasyAleert

/* Crie uma extension da sua UIViewController e implemente o protocolo EasyAleertDelegate e exiba o alert em sua tela */
extension ViewController: EasyAlertDelegate {
    func show(_ alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
}


/* Para exibir um alert na tela, utilize uma dessas funções */

/* Exibe um alerta de sucesso, erro ou warning */
func showAlert(){
    self.easyAlert?.showMessageAlert("Minha Mensagem", style: .success, onDissmiss: nil)
}

/* Exibe um alert de confirmação, com callbacks para os botões de OK e Cancelar */
func showConfirmation(){
    self.easyAlert?.showConfirmationAlert(title: "Título", message: "Mensagem", okCompletion: nil, cancelCompletion: nil)
}

/* Exibe um toast na tela, podendo alterar a sua duração */
func showToast(){
    self.easyAlert?.showToast("Meu Toast", duration: 2)
}

```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](https://choosealicense.com/licenses/mit/)

