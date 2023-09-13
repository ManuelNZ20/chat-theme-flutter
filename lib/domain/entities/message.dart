enum FromWho { me, hers }

class Message {
  final String message;
  final FromWho fromWho;
  final String? imgUrl;

  Message({required this.message, required this.fromWho, this.imgUrl = ''});

}
