import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  final AgoraClient _client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: '5bfafd5972f444f19b27c27683e395a0',
      channelName: 'agora-testing',
      tempToken:
          '007eJxTYHgQ+Vu0Kvt58apfsSLdPlas69+nnigR1WzaY2oh8/gjv48Cg2lSWmJaiqmluVGaiYlJmqFlkpF5spG5mYVxqrGlaaJBiJJvWkMgI8OqxYaMjAwQCOLzMiSm5xcl6pakFpdk5qUzMAAAR84hmQ==',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Video Call'),
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: _client,
                layoutType: Layout.floating,
                showNumberOfUsers: true,
              ),
              AgoraVideoButtons(
                client: _client,
                enabledButtons: const [
                  BuiltInButtons.toggleCamera,
                  BuiltInButtons.callEnd,
                  BuiltInButtons.toggleMic,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initAgora();
  }

  Future<void> _initAgora() async {
    await _client.initialize();
    print('Agora initialized');
    print(_client);
  }
}
