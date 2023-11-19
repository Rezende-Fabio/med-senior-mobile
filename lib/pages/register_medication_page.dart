import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/button_footer.dart';
import '../components/form_register_medication.dart';
import 'package:camera/camera.dart';

class RegisterMedication extends StatefulWidget {
  final String titlePage;
  final String textButton;
  const RegisterMedication(this.titlePage, this.textButton, {super.key});

  @override
  State<RegisterMedication> createState() => _RegisterMedicationState();
}

class _RegisterMedicationState extends State<RegisterMedication> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  bool _capturaImage = false;

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();

    if (_cameras != null && _cameras.isNotEmpty) {
      _controller = CameraController(_cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
      if (!mounted) {
        return;
      }
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  void _onCaptureButtonPressed() async {
    try {
      //final XFile file = await _controller.takePicture();
      print("Imagem salva");
      setState(() {
        _capturaImage = true;
      });
    } catch (e) {
      print("Erro ao capturar imagem: $e");
    }
    _controller.dispose();
    setState(() {
      _isCameraInitialized = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _isCameraInitialized
          ? Column(
              children: [
                CameraPreview(_controller),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)),
                    child: IconButton(
                        iconSize: 45,
                        onPressed: _onCaptureButtonPressed,
                        icon: const Icon(Icons.camera_alt)),
                  ),
                )
              ],
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, bottom: 25, left: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => {Navigator.of(context).pop()},
                              icon: const Icon(Icons.arrow_back_ios_new),
                            ),
                            Text(
                              widget.titlePage,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            const Text(
                              "",
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0)),
                              color: Color.fromARGB(255, 211, 211, 211)),
                          child: Column(
                            children: [
                              FormRegisterMedi(
                                  _initializeCamera, _capturaImage),
                              ButtonFooter(widget.textButton, "", const {}),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    if (_isCameraInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }
}
