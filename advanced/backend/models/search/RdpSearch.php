<?php

namespace app\models\search;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\models\Rdp;

/**
 * RdpSearch represents the model behind the search form about `app\models\Rdp`.
 */
class RdpSearch extends Rdp
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'port', 'type'], 'integer'],
            [['ip', 'username', 'password', 'all_user_info', 'notice', 'add_time'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Rdp::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'port' => $this->port,
            'type' => $this->type,
            'add_time' => $this->add_time,
        ]);

        $query->andFilterWhere(['like', 'ip', $this->ip])
            ->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'password', $this->password])
            ->andFilterWhere(['like', 'all_user_info', $this->all_user_info])
            ->andFilterWhere(['like', 'notice', $this->notice]);

        return $dataProvider;
    }
}
