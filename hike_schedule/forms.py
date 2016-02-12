from django import forms

class ImportForm(forms.Form):
    year = forms.IntegerField()
    data = forms.CharField(
        widget=forms.Textarea(
            attrs={'rows': 15, 'cols': 100}
        )
    )
