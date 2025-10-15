#!/usr/bin/env python3
"""Clean all markdown files from mojibake and emoji remnants."""
import os
import re
from pathlib import Path

# Mojibake patterns and their replacements
MOJIBAKE_MAP = {
    'â„¢': 'TM',
    'â€"': '--',
    'â€"': '-',
    'â€•': '--',
    'â€¦': '...',
    'â€œ': '"',
    'â€': '"',
    'â€˜': "'",
    'â€™': "'",
    'â†'': '->',
    'â†': '<-',
    'âœ…': '',
    'âœ"': '',
    'âŒ': '',
}

def clean_text(text):
    """Remove mojibake and emojis from text."""
    # Replace mojibake patterns
    for pattern, replacement in MOJIBAKE_MAP.items():
        text = text.replace(pattern, replacement)
    
    # Remove emoji mojibake lead sequences
    text = text.replace('ðŸ', '')
    text = text.replace('ï¸', '')
    text = text.replace('Â', '')
    
    # Remove Unicode emoji ranges
    emoji_pattern = re.compile(
        "[\U0001F300-\U0001FAFF"  # Misc Symbols and Pictographs
        "\U0001F1E6-\U0001F1FF"    # Regional Indicator Symbols (flags)
        "\U00002600-\U000027BF"    # Misc symbols
        "\uFE0F\u200D\uFFFD"       # VS16, ZWJ, replacement
        "]+", flags=re.UNICODE
    )
    text = emoji_pattern.sub('', text)
    
    return text

def clean_file(file_path):
    """Clean a single markdown file."""
    try:
        with open(file_path, 'r', encoding='utf-8', errors='replace') as f:
            content = f.read()
        
        cleaned = clean_text(content)
        
        if cleaned != content:
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(cleaned)
            return True
    except Exception as e:
        print(f"Error processing {file_path}: {e}")
    return False

def main():
    root = Path(r"C:\Users\Mr. R\Desktop\WARP-BMAD v2")
    md_files = list(root.rglob("*.md"))
    
    print(f"Found {len(md_files)} markdown files")
    changed = 0
    
    for md_file in md_files:
        if clean_file(md_file):
            changed += 1
            print(f"Fixed: {md_file.name}")
    
    print(f"\nTotal: {len(md_files)} files")
    print(f"Changed: {changed} files")

if __name__ == "__main__":
    main()
