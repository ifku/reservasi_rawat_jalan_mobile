import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';

class RRJFamilyItemCard extends StatelessWidget {
  const RRJFamilyItemCard({
    super.key,
    required this.title,
    required this.name,
  });

  final String title;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 80.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.all(Radius.circular(6.0))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 48.0,
                width: 48.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    shape: BoxShape.circle),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                  child:
                  Assets.icons.iconGroupPeople.svg(
                    height: 36.0,
                    width: 36.0,
                    alignment: Alignment.center,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.5),
                          )),
                  const SizedBox(height: 4.0),
                  Text(name,
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios,
                  size: 16.0,
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5))
            ],
          ),
        ),
      ),
    );
  }
}
