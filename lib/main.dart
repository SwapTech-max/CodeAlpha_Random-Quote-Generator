import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(QuoteApp());

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}

class QuoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(bodyLarge: TextStyle(fontSize: 18)),
      ),
      home: QuoteHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuoteHomePage extends StatefulWidget {
  @override
  _QuoteHomePageState createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage> {
  final List<Quote> _quotes = [
    Quote(
        text: "Be yourself; everyone else is already taken.",
        author: "Oscar Wilde"),
    Quote(text: "Stay hungry, stay foolish.", author: "Steve Jobs"),
    Quote(
        text: "In the middle of every difficulty lies opportunity.",
        author: "Albert Einstein"),
    Quote(
        text: "Success is not in what you have, but who you are.",
        author: "Bo Bennett"),
    Quote(
        text: "What you do today can improve all your tomorrows.",
        author: "Ralph Marston"),
    Quote(text: "Dream big and dare to fail.", author: "Norman Vaughan"),
    Quote(text: "Turn your wounds into wisdom.", author: "Oprah Winfrey"),
    Quote(text: "Dream big and dare to fail.", author: "Norman Vaughan"),
    Quote(
        text: "Do one thing every day that scares you.",
        author: "Eleanor Roosevelt"),
    Quote(
        text:
            "Success is not final, failure is not fatal: it is the courage to continue that counts.",
        author: "Winston Churchill"),
    Quote(
        text: "In the middle of difficulty lies opportunity.",
        author: "Albert Einstein"),
    Quote(
        text:
            "It does not matter how slowly you go as long as you do not stop.",
        author: "Confucius"),
    Quote(
        text: "Everything you’ve ever wanted is on the other side of fear.",
        author: "George Addair"),
    Quote(
        text:
            "Hardships often prepare ordinary people for an extraordinary destiny.",
        author: "C.S. Lewis"),
    Quote(
        text:
            "The only limit to our realization of tomorrow is our doubts of today.",
        author: "Franklin D. Roosevelt"),
    Quote(
        text: "Act as if what you do makes a difference. It does.",
        author: "William James"),
    Quote(
        text: "Believe you can and you’re halfway there.",
        author: "Theodore Roosevelt"),
    Quote(text: "Turn your wounds into wisdom.", author: "Oprah Winfrey"),
    Quote(
        text:
            "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
        author: "Ralph Waldo Emerson"),
    Quote(
        text:
            "Happiness is not something ready-made. It comes from your own actions.",
        author: "Dalai Lama"),
    Quote(
        text: "If you’re going through hell, keep going.",
        author: "Winston Churchill"),
    Quote(
        text: "Strive not to be a success, but rather to be of value.",
        author: "Albert Einstein"),
    Quote(
        text: "You miss 100% of the shots you don’t take.",
        author: "Wayne Gretzky"),
    Quote(
        text: "Whether you think you can or you think you can’t, you’re right.",
        author: "Henry Ford"),
    Quote(
        text: "The best revenge is massive success.", author: "Frank Sinatra"),
    Quote(
        text: "I have not failed. I’ve just found 10,000 ways that won’t work.",
        author: "Thomas A. Edison"),
    Quote(
        text:
            "Your time is limited, so don’t waste it living someone else’s life.",
        author: "Steve Jobs"),
    Quote(
        text: "The journey of a thousand miles begins with one step.",
        author: "Lao Tzu"),
    Quote(
        text: "Fall seven times and stand up eight.",
        author: "Japanese Proverb"),
    Quote(
        text: "A person who never made a mistake never tried anything new.",
        author: "Albert Einstein"),
    Quote(
        text: "The mind is everything. What you think you become.",
        author: "Buddha"),
    Quote(
        text: "Life is what happens when you’re busy making other plans.",
        author: "John Lennon"),
    Quote(
        text: "Don’t watch the clock; do what it does. Keep going.",
        author: "Sam Levenson"),
    Quote(
        text:
            "Keep your face always toward the sunshine—and shadows will fall behind you.",
        author: "Walt Whitman"),
    Quote(
        text: "Doubt kills more dreams than failure ever will.",
        author: "Suzy Kassem"),
    Quote(
        text:
            "Go confidently in the direction of your dreams. Live the life you have imagined.",
        author: "Henry David Thoreau"),
    Quote(
        text: "The only way to do great work is to love what you do.",
        author: "Steve Jobs"),
    Quote(
        text: "It always seems impossible until it’s done.",
        author: "Nelson Mandela"),
    Quote(
        text: "Don’t let yesterday take up too much of today.",
        author: "Will Rogers"),
    Quote(
        text: "The harder the conflict, the more glorious the triumph.",
        author: "Thomas Paine"),
    Quote(
        text: "Be yourself; everyone else is already taken.",
        author: "Oscar Wilde"),
    Quote(
        text: "Limit your 'always' and your 'nevers'.", author: "Amy Poehler"),
    Quote(
        text: "Try to be a rainbow in someone’s cloud.",
        author: "Maya Angelou"),
    Quote(text: "Nothing will work unless you do.", author: "Maya Angelou"),
    Quote(
        text: "Everything has beauty, but not everyone sees it.",
        author: "Confucius"),
    Quote(
        text: "The best way to predict the future is to create it.",
        author: "Peter Drucker"),
    Quote(
        text: "You only live once, but if you do it right, once is enough.",
        author: "Mae West"),
    Quote(
        text: "Do what you can, with what you have, where you are.",
        author: "Theodore Roosevelt"),
    Quote(
        text: "You must be the change you wish to see in the world.",
        author: "Mahatma Gandhi"),
    Quote(text: "Stay hungry, stay foolish.", author: "Steve Jobs"),
    Quote(
        text: "He who has a why to live can bear almost any how.",
        author: "Friedrich Nietzsche"),
    Quote(
        text:
            "Don’t be pushed around by the fears in your mind. Be led by the dreams in your heart.",
        author: "Roy T. Bennett"),
    Quote(
        text:
            "Learn as if you will live forever, live like you will die tomorrow.",
        author: "Mahatma Gandhi"),
    Quote(
        text:
            "The future belongs to those who believe in the beauty of their dreams.",
        author: "Eleanor Roosevelt"),
    Quote(
        text:
            "What you get by achieving your goals is not as important as what you become by achieving your goals.",
        author: "Zig Ziglar"),
    Quote(text: "Be so good they can’t ignore you.", author: "Steve Martin"),
    Quote(
        text:
            "Success usually comes to those who are too busy to be looking for it.",
        author: "Henry David Thoreau"),
  ];

  late Quote _currentQuote;

  @override
  void initState() {
    super.initState();
    // Show random quote on app start
    _currentQuote = _quotes[Random().nextInt(_quotes.length)];
  }

  void _getNewQuote() {
    setState(() {
      // Avoid repeating the same quote
      Quote newQuote;
      do {
        newQuote = _quotes[Random().nextInt(_quotes.length)];
      } while (newQuote == _currentQuote);
      _currentQuote = newQuote;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Quote Generator"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: Colors.deepPurple[50],
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.format_quote, size: 40, color: Colors.deepPurple),
                  SizedBox(height: 20),
                  Text(
                    '"${_currentQuote.text}"',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontStyle: FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '- ${_currentQuote.author}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton.icon(
                    onPressed: _getNewQuote,
                    icon: Icon(Icons.refresh),
                    label: Text("New Quote"),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
