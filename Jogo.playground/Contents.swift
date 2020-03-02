import UIKit
import PlaygroundSupport

class telainicial : UIViewController {
        
    override func loadView(){
        
        var label, labelUm : UILabel!
        var botaoinicio : UIButton!
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1)
        view.layer.borderColor = #colorLiteral(red: 0.7647058824, green: 1, blue: 0.3843137255, alpha: 1)
        view.layer.borderWidth = 10
        view.layer.cornerRadius = 20
        
        let caixagrande = UIView()
        caixagrande.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        caixagrande.layer.cornerRadius = 20
        view.addSubview(caixagrande)
        
        label = UILabel()
        label.text = "BeaQUIZ\n\n"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 8
        label.font = UIFont.boldSystemFont(ofSize: 60)
       // label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        //        label.frame = CGRect(x: 0, y: 120, width: 305, height: 30)

        label.textAlignment = .center
        caixagrande.addSubview(label)
        
        labelUm = UILabel()
        labelUm.text = "Um mini quiz sobre\na vida de beabelha"
        labelUm.lineBreakMode = .byWordWrapping
        labelUm.numberOfLines = 8
        labelUm.textColor = .white
        labelUm.frame = CGRect(x: 0, y: 150, width: 105, height: 30)
        labelUm.font = UIFont.systemFont(ofSize: 20)
        labelUm.translatesAutoresizingMaskIntoConstraints = false
        label.addSubview(labelUm)
        
        botaoinicio = MeuBtn()
        botaoinicio.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        botaoinicio.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        botaoinicio.setTitle("BORA LÁ!!!", for: .normal)
        botaoinicio.addTarget(self, action: #selector(aaa), for: .touchUpInside)
        view.addSubview(botaoinicio)
        
        let img = UIImage(named: "BEE.png")
        let imgview = UIImageView(frame: CGRect(x: 150, y: 520, width: 80, height: 80))
        imgview.image = img
        view.addSubview(imgview)
        
        //layout
        
        botaoinicio.translatesAutoresizingMaskIntoConstraints = false
       
        label.translatesAutoresizingMaskIntoConstraints = false
        caixagrande.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                   
        // quadro de perguntas
        caixagrande.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        caixagrande.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        caixagrande.widthAnchor.constraint(equalToConstant: 315),
        caixagrande.heightAnchor.constraint(equalToConstant: 260),
        
        label.centerXAnchor.constraint(equalTo: caixagrande.centerXAnchor),
        label.centerYAnchor.constraint(equalTo: caixagrande.centerYAnchor),
        label.heightAnchor.constraint(equalToConstant: 205),
        
        labelUm.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
        labelUm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 105),
        labelUm.widthAnchor.constraint(equalToConstant: 315),
        labelUm.heightAnchor.constraint(equalToConstant: 260),
        
//        labelUm.centerXAnchor.constraint(equalTo: label.centerXAnchor),
//        labelUm.heightAnchor.constraint(equalToConstant: 80),
//        labelUm.topAnchor.constraint(equalTo: label.topAnchor, constant: 115),
//
        botaoinicio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        botaoinicio.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
        botaoinicio.heightAnchor.constraint(equalToConstant: 53),
        botaoinicio.widthAnchor.constraint(equalToConstant: 215),
            
        ])
        
        self.view = view
    }
//    botao.addTarget()
    @objc func aaa()
    {
        let quiz = quizinho()
        navigationController?.pushViewController(quiz, animated: false)
    }
}

class MeuBtn : UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        desenharBtn()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        desenharBtn()
    }
    
    private func desenharBtn()
    {
        layer.cornerRadius = 10
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.darkGray.cgColor
    }
}
class quizinho : UIViewController {
    
    let perguntas = ["Qual é a data de nascimento \n da Beatriz?", "Qual o nome completo dela?", "Um pet inusitado que ela já teve?", "O que ela queria ser quando \nela crescesse?","Qual o curso que a Bea faz?","Como a Bea conheceu o T.I?","Qual curso ela já fez?", "Hobbie dela em 2017?", "Que instrumento ela toca?", "Anime favorito dela?"]
    let asrespostas = ["05/05/1998", "12/02/2002", "83/13/2021", "42 a.C.",
    "Beatriz Silva", "Bianca Balinha de Goma", "Beatriz Gomes da Silva", "Brenda Gomes",
    "Girafa", "Galo", "Chewbacca", "Furão",
    "Grande", "Pilota de Celta", "Médica", "Bióloga",
    "Curso do Ben10", "Ciência da Computação", "Sistemas para Internet", "TADS",
    "PC deu pau", "Achou um PC véio na rua", "Curso Profissionalizante", "O pai obrigou",
    "Ben10", "Graduação em Beatles", "Fotografia", "Estética",
    "Dançar", "Tirar racha de corsinha", "Falar baboseira", "Andar de bike",
    "Violão", "Piano", "GuitarHero", "Bateria de Panela",
    "Boku no Pico", "One Piece", "Naruto", "Jojo"]
    let respostasCorretas = [1, 3, 2, 4, 3, 3, 3, 1, 2, 2]
    var perguntaContador = 0
    var contadorRespostas = 0
    
    var label : UILabel!
    
    var blocoUm, blocoDois, blocoTres, blocoQuatro : UIButton!
    override func loadView() {
        
        // UI
        
        // borda
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1)
        view.layer.borderColor = #colorLiteral(red: 0.7647058824, green: 1, blue: 0.3843137255, alpha: 1)
        view.layer.borderWidth = 10
        view.layer.cornerRadius = 20
        
    
        // caixa grande
        
        let innerView = UIView()
        innerView.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        innerView.layer.cornerRadius = 20
        view.addSubview(innerView)
        
        label = UILabel()
        //        label.text = "Qual é a data de nascimento \n da Beatriz?"
        label.text = perguntas[perguntaContador]
        //   label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.textColor = .white
        //        label.frame = CGRect(x: 0, y: 120, width: 305, height: 30)
        //   label.backgroundColor = .red
        label.textAlignment = .center
        innerView.addSubview(label)
        
        //bloco Um
        blocoUm = MeuBtn()
        blocoUm.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
      //  blocoUm.layer.masksToBounds = true
     //   blocoUm.layer.cornerRadius = 20
        blocoUm.tag = 1
        blocoUm.setTitle("05/05/1998", for: .normal)
        blocoUm.addTarget(self, action: #selector(clickUm), for: .touchUpInside)
        view.addSubview(blocoUm)
        
        //bloco Dois
        blocoDois = MeuBtn()
        blocoDois.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
     //   blocoDois.layer.masksToBounds = true
    //    blocoDois.layer.cornerRadius = 20
        blocoDois.tag = 2
        blocoDois.setTitle("12/02/2002", for: .normal)
        blocoDois.addTarget(self, action: #selector(clickUm), for: .touchUpInside)
        view.addSubview(blocoDois)
        
        //bloco Tres
        blocoTres = MeuBtn()
        blocoTres.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
    //    blocoTres.layer.masksToBounds = true
  //      blocoTres.layer.cornerRadius = 20
        blocoTres.tag = 3
        blocoTres.setTitle("83/13/2021", for: .normal)
        blocoTres.addTarget(self, action: #selector(clickUm), for: .touchUpInside)
        view.addSubview(blocoTres)
        
        //bloco Quatro
        blocoQuatro = MeuBtn()
        blocoQuatro.backgroundColor =  #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
     //   blocoQuatro.layer.masksToBounds = true
       // blocoQuatro.layer.cornerRadius = 20
        blocoQuatro.tag = 4
        blocoQuatro.setTitle("42 a.C.", for: .normal)
        blocoQuatro.addTarget(self, action: #selector(clickUm), for: .touchUpInside)
        view.addSubview(blocoQuatro)
        
        // Layout
        
        blocoQuatro.translatesAutoresizingMaskIntoConstraints = false
        blocoTres.translatesAutoresizingMaskIntoConstraints = false
        blocoDois.translatesAutoresizingMaskIntoConstraints = false
        blocoUm.translatesAutoresizingMaskIntoConstraints = false
        innerView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            // quadro de perguntas
            innerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            innerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            innerView.widthAnchor.constraint(equalToConstant: 315),
            innerView.heightAnchor.constraint(equalToConstant: 260),
            
            label.centerXAnchor.constraint(equalTo: innerView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: innerView.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 100),
            
            //blocoUm
            blocoUm.topAnchor.constraint(equalTo: innerView.bottomAnchor, constant: 30),
            blocoUm.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            blocoUm.widthAnchor.constraint(equalToConstant: 315),
            blocoUm.heightAnchor.constraint(equalToConstant: 53),
            
            //blocoDois
            blocoDois.topAnchor.constraint(equalTo: blocoUm.bottomAnchor, constant: 30),
            blocoDois.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            blocoDois.widthAnchor.constraint(equalToConstant: 315),
            blocoDois.heightAnchor.constraint(equalToConstant: 53),
            
            //blocoTres
            blocoTres.topAnchor.constraint(equalTo: blocoDois.bottomAnchor, constant: 30),
            blocoTres.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            blocoTres.widthAnchor.constraint(equalToConstant: 315),
            blocoTres.heightAnchor.constraint(equalToConstant: 53),
            
            //blocoQuatro
            blocoQuatro.topAnchor.constraint(equalTo: blocoTres.bottomAnchor, constant: 30),
            blocoQuatro.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            blocoQuatro.widthAnchor.constraint(equalToConstant: 315),
            blocoQuatro.heightAnchor.constraint(equalToConstant: 53),
        ])
    
        
        self.view = view
    }
    
    //verifica se a resposta est'a correta
    @objc func clickUm(sender: UIButton){
        //print("Valor array (Reposta Correta) = " + String(respostasCorretas[0]))
        //print("Valor botao (Reposta Respondida) = " + String(sender.tag))
        
        if sender.tag == respostasCorretas[perguntaContador]{
            sender.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1)
            Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false, block: {timer in self.correta()})
        }
        else{
            sender.backgroundColor = .red
        }
    }
    
    @objc func correta(){
        perguntaContador += 1
     //   print(perguntaContador)
        
        if perguntaContador == 10 {
            let fim = Telafinal()
            navigationController?.pushViewController(fim, animated: false)
            return
        }
        
        label.text = perguntas[perguntaContador]
        
        blocoUm.setTitle(asrespostas[0 + perguntaContador], for: .normal)
        blocoDois.setTitle(asrespostas[1 + perguntaContador], for: .normal)
        blocoTres.setTitle(asrespostas[2 + perguntaContador], for: .normal)
        blocoQuatro.setTitle(asrespostas[3 + perguntaContador], for: .normal)
        
        
        colorirBotao()
    }
        
    @objc func montarRespostas(){
        contadorRespostas += 4
        
        blocoUm.setTitle(asrespostas[0 + contadorRespostas], for: .normal)
        blocoDois.setTitle(asrespostas[1 + contadorRespostas], for: .normal)
        blocoTres.setTitle(asrespostas[2 + contadorRespostas], for: .normal)
        blocoQuatro.setTitle(asrespostas[3 + contadorRespostas], for: .normal)
        
        blocoUm.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        blocoDois.backgroundColor =  #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        blocoTres.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        blocoQuatro.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
    }
    
    @objc func colorirBotao(){
        blocoUm.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1)
        blocoDois.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1)
        blocoTres.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1)
        blocoQuatro.backgroundColor = #colorLiteral(red: 0.7843137255, green: 0.8470588235, blue: 0.4117647059, alpha: 1)
        montarRespostas()
    }
    
    func incorreta(){
    
    }

}

class Telafinal : UIViewController {
     override func loadView(){
        
        var label, label1 : UILabel
        var botaoinicio : UIButton!
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1725490196, green: 0.1725490196, blue: 0.1725490196, alpha: 1)
        view.layer.borderColor = #colorLiteral(red: 0.7647058824, green: 1, blue: 0.3843137255, alpha: 1)
        view.layer.borderWidth = 10
        view.layer.cornerRadius = 20
        
        // caixa grande
        
        let caixafinal = UIView()
        caixafinal.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        caixafinal.layer.cornerRadius = 20
        caixafinal.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(caixafinal)
        
        label = UILabel()
        label.text = "PARABÉNS!!\n"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 8
        label.font = UIFont.boldSystemFont(ofSize: 50)
        // label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        //        label.frame = CGRect(x: 0, y: 120, width: 305, height: 30)

        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        caixafinal.addSubview(label)
                
        label1 = UILabel()
        label1.text = "Agora você conhece\nconhece a BeaBelha"
        label1.lineBreakMode = .byWordWrapping
        label1.numberOfLines = 8
        label1.textColor = .white
        label1.frame = CGRect(x: 0, y: 150, width: 105, height: 30)
        label1.font = UIFont.systemFont(ofSize: 20)
        label1.translatesAutoresizingMaskIntoConstraints = false
        label.addSubview(label1)
                
        botaoinicio = MeuBtn()
        botaoinicio.backgroundColor = #colorLiteral(red: 0.3996284604, green: 0.3609669209, blue: 0.6471484303, alpha: 1)
        botaoinicio.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        botaoinicio.setTitle("Jogar novamente", for: .normal)
        botaoinicio.addTarget(self, action: #selector(comeco), for: .touchUpInside)
        botaoinicio.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(botaoinicio)
                
        let img = UIImage(named: "BEE.png")
        let imgview = UIImageView(frame: CGRect(x: 150, y: 520, width: 80, height: 80))
        imgview.image = img
        view.addSubview(imgview)
                
        //layout
                
        
        
        
        
                
        NSLayoutConstraint.activate([
                           
        // quadro de perguntas
        caixafinal.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        caixafinal.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        caixafinal.widthAnchor.constraint(equalToConstant: 315),
        caixafinal.heightAnchor.constraint(equalToConstant: 260),
            
        label.centerXAnchor.constraint(equalTo: caixafinal.centerXAnchor),
        label.centerYAnchor.constraint(equalTo: caixafinal.centerYAnchor),
        label.heightAnchor.constraint(equalToConstant: 205),
        
        label1.centerXAnchor.constraint(equalTo: label.centerXAnchor),
        //        label1.centerYAnchor.constraint(equalTo: label.centerYAnchor),
        label1.heightAnchor.constraint(equalToConstant: 80),
        label1.topAnchor.constraint(equalTo: label.topAnchor, constant: 115),
        // label1.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 20),
        //label1.widthAnchor.constraint(equalToConstant: 315),
        //  label1.heightAnchor.constraint(equalToConstant: 30),
            
        botaoinicio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        botaoinicio.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
        botaoinicio.heightAnchor.constraint(equalToConstant: 53),
        botaoinicio.widthAnchor.constraint(equalToConstant: 215),
                    
        //        botaoinicio.topAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        // botaoinicio.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
        //        botaoinicio.widthAnchor.constraint(equalToConstant: 215),
        //        botaoinicio.heightAnchor.constraint(equalToConstant: 53),
                    
        ])
        
        self.view = view
    }
    @objc func comeco()
    {
        let jogo = telainicial()
        //navigationController?.pushViewController(jogo, animated: false)
        navigationController?.popToRootViewController(animated: false)
    }
}

let viewController = telainicial()
let navigation = UINavigationController(rootViewController: viewController)
viewController.preferredContentSize = CGSize(width: 375, height: 612)
navigation.navigationBar.isHidden = true
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = navigation

