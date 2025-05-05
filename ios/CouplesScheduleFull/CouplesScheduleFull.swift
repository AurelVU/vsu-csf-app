//
//  CouplesScheduleFull.swift
//  CouplesScheduleFull
//
//  Created by Владимир Ушаков on 27.12.2023.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        return SimpleEntry(date: Date())
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> Void) {
        let date = Date()
        let entry = SimpleEntry(
            date: date
        )


        // Create a date that's 15 minutes in the future.
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: date)!


        // Call the completion to pass the timeline to WidgetKit.
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> Void) {

        let date = Date()
        let entry = SimpleEntry(
            date: date
        )


        // Create a date that's 15 minutes in the future.
        let nextUpdateDate = Calendar.current.date(byAdding: .minute, value: 15, to: date)!


        // Create the timeline with the entry and a reload policy with the date
        // for the next update.
        let timeline = Timeline(
            entries:[entry],
            policy: .after(nextUpdateDate)
        )


        // Call the completion to pass the timeline to WidgetKit.
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date: Date
}

extension View {
    func widgetBackground(_ color: Color) -> some View {
        if #available(iOSApplicationExtension 17.0, macOSApplicationExtension 14.0, *) {
            return  containerBackground(color, for: .widget)
        } else {
            return background(color)
        }
    }
}

struct CouplesScheduleFullEntryView : View {
    var entry: Provider.Entry
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some View {
        VStack(spacing: 16) {
            if widgetFamily == .systemLarge {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.cartGray)
                    HStack(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Администрирование в информационных системах (лаб)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            if widgetFamily != .systemSmall {
                                Spacer()
                            }
                            Text("Коваль Андрей Сергеевич")
                        }
                        if widgetFamily != .systemSmall {
                            Spacer()
                        }
                        if widgetFamily != .systemSmall {
                            VStack(alignment: .leading) {
                                Text("09:45")
                                Text("11:20")
                                Text("к. 290").padding(.top, 2)
                            }
                        }
                    }.padding(.all, widgetFamily == .systemSmall || widgetFamily == .systemMedium ? 0 : 16)
                }.foregroundColor(.black)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.accent)
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("Администрирование в информационных системах (лаб)").fontWeight(.bold)
                        if widgetFamily != .systemSmall {
                            Spacer()
                        }
                        if widgetFamily != .systemSmall {
                            Text("Коваль Андрей Сергеевич")
                        }
                        if widgetFamily == .systemSmall {
                            Text("к. 290")
                        }
                    }
                    if widgetFamily != .systemSmall {
                        Spacer()
                    }
                    if widgetFamily != .systemSmall {
                        VStack(alignment: .leading) {
                            Text("09:45")
                            Text("11:20")
                            Text("к. 290").padding(.top, 2)
                        }
                    }
                }.padding(.all, widgetFamily == .systemSmall || widgetFamily == .systemMedium ? 0 : 16)
            }.foregroundColor(.white)
        }.widgetBackground(widgetFamily == .systemSmall || widgetFamily == .systemMedium ? .accent : .white)
    }
}

struct CouplesScheduleFull: Widget {
    let kind: String = "CouplesScheduleFull"
    
    @Environment(\.widgetFamily) var widgetFamily
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            CouplesScheduleFullEntryView(entry: entry)
        }.configurationDisplayName("Расписание")
            .description("Ваше расписание занятий")
            .supportedFamilies([
                .systemSmall,
                .systemMedium,
                .systemLarge
            ])
    }
}

struct Widget_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CouplesScheduleFullEntryView(entry: .init(date: Date()))
        }.previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
