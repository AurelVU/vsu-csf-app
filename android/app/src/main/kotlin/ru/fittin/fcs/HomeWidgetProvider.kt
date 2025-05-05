package ru.fittin.fcs

import android.appwidget.AppWidgetProvider
import android.appwidget.AppWidgetManager
import android.view.View
import android.widget.RemoteViews
import java.io.File
import android.graphics.BitmapFactory
import android.graphics.Bitmap
import android.content.Context

import es.antonborri.home_widget.HomeWidgetPlugin


class HomeWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
            context: Context,
            appWidgetManager: AppWidgetManager,
            appWidgetIds: IntArray,
    ) {
        for (appWidgetId in appWidgetIds) {
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.main).apply {
                val status = widgetData.getString("status", null)
                val subject = widgetData.getString("subject", null)
                val time = widgetData.getString("time", null)
                val audit = widgetData.getString("audit", null)
                val teacher = widgetData.getString("teacher", null)

                setTextViewText(R.id.statusTextView, status ?: "No status set")
                setTextViewText(R.id.subjectTextView, subject ?: "No subject set")
                setTextViewText(R.id.timeTextView, time ?: "No time set")
                setTextViewText(R.id.auditTextView, audit ?: "No audit set")
                setTextViewText(R.id.teacherTextView, teacher ?: "No teacher set")
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
