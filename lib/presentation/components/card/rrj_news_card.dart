import 'package:flutter/material.dart';
import 'package:reservasi_rawat_jalan_mobile/core/gen/assets.gen.dart';
import 'package:reservasi_rawat_jalan_mobile/presentation/components/button/rrj_outlined_button.dart';

class RRJNewsCard extends StatelessWidget {
  const RRJNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 180.0,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
              offset: const Offset(0, 4),
              blurRadius: 4.0,
            ),
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 60.0,
            width: 180.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                RRJAssets.images.imageExample.path,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "December 20, 2023",
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Bahaya Kurang Air Putih, Dehidrasi sampai Picu Penyakit",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 8.0),
                RRJOutlinedButton(
                  height: 0.0,
                  width: 120.0,
                  onPressed: () {},
                  padding: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                    vertical: 0.0,
                  ),
                  borderColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    "Lanjut membaca",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
