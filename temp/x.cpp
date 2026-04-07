#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main() {
    ifstream file1("file1.txt");
    ifstream file2("file2.txt");
    ofstream output("updated_secondfile.txt");

    if (!file1 || !file2 || !output) {
        cout << "Error opening files!" << endl;
        return 1;
    }

    string word, content, line;

    // Read word from file1 (assuming one word or line)
    getline(file1, word);

    // Read entire file2 content
    while (getline(file2, line)) {
        content += line + "\n";
    }

    // Remove all occurrences of word
    size_t pos;
    while ((pos = content.find(word)) != string::npos) {
        content.erase(pos, word.length());
    }

    // Write cleaned content
    output << content;

    file1.close();
    file2.close();
    output.close();

    cout << "Updated file created successfully!" << endl;

    return 0;
}