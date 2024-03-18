import 'package:flutter/material.dart';
import 'package:tennis_club_app/data/models/EventModel.dart';
import 'package:tennis_club_app/localization.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Semantics(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                container: true,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: DefaultTextStyle(
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium!,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            eventModel.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.black54),
                          ),
                        ),
                        Text(
                          eventModel.description,
                          maxLines: 30,
                        ),
                        Text(
                            'When?  ${Localization.formatDate(eventModel.date)}'),
                        Text('Where?  ${eventModel.location}'),
                        Text(
                            'Register Until?  ${Localization.formatDate(eventModel.registerDate)}'),
                        Text(
                            'Max. Participants?  ${eventModel.maxParticipants.toString()}'),
                        Text('Cost?  ${eventModel.cost}€'),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
