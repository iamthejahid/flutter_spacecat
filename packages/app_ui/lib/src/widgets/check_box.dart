// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_ui/app_ui.dart';

class CheckBoxController extends ChangeNotifier {
  bool isSelected = false;

  void toggleOps() {
    isSelected = !isSelected;
    notifyListeners();
  }
}

class CustomCheckBox<T> extends StatefulWidget {
  CustomCheckBox({
    Key? key,
    required this.onSelect,
    required this.onRemove,
    required this.checkBoxTitle,
    required this.value,
    required this.isSelected,
  }) : super(key: key);

  final Function(T value) onSelect;
  final VoidCallback onRemove;
  final String checkBoxTitle;
  final T value;
  final bool isSelected;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState<T> extends State<CustomCheckBox<T>>
    with SingleTickerProviderStateMixin {
  final CheckBoxController _c = CheckBoxController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 1.5, bottom: 1.5),
      child: Row(
        children: [
          AnimatedBuilder(
            animation: _c,
            builder: (context, child) => GestureDetector(
              onTap: widget.isSelected
                  ? widget.onRemove
                  : () {
                      widget.onSelect(widget.value);
                    },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                switchInCurve: Curves.easeInOutBack,
                transitionBuilder: (c, a) => ScaleTransition(
                  scale: a,
                  child: c,
                ),
                child: widget.isSelected
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        key: const ValueKey("check"),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 18,
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        key: const ValueKey("u_check"),
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey, width: 2.0)),
                        child: const Icon(
                          Icons.check,
                          color: Colors.transparent,
                          size: 18,
                        ),
                      ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _c,
            builder: (context, child) => GestureDetector(
              onTap: widget.isSelected
                  ? widget.onRemove
                  : () => widget.onSelect(widget.value),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                switchInCurve: Curves.easeInOutBack,
                transitionBuilder: (c, a) => ScaleTransition(
                  scale: a,
                  child: c,
                ),
                child: widget.isSelected
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        key: const ValueKey("ct"),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        key: const ValueKey("u_ct"),
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _c,
            builder: (context, child) => GestureDetector(
              onTap: widget.isSelected
                  ? widget.onRemove
                  : () {
                      widget.onSelect(widget.value);
                    },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                switchInCurve: Curves.easeInOutBack,
                transitionBuilder: (c, a) => ScaleTransition(
                  scale: a,
                  child: c,
                ),
                child: widget.isSelected
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          widget.checkBoxTitle,
                          style: UITextStyle.bodyText1,
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          widget.checkBoxTitle,
                          style: UITextStyle.bodyText1,
                        ),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
