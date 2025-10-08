package com.example.clickcounter

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class MainActivity : AppCompatActivity() {

    private var count = 0  // Keeps track of clicks

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val textViewCount = findViewById<TextView>(R.id.textViewCount)
        val buttonClick = findViewById<Button>(R.id.buttonClick)
        val buttonReset = findViewById<Button>(R.id.buttonReset)

        // Increment button
        buttonClick.setOnClickListener {
            count++
            textViewCount.text = count.toString()
        }

        // Reset button
        buttonReset.setOnClickListener {
            count = 0
            textViewCount.text = count.toString()
        }
    }
}
